/**
 * @file RecieveData.c
 * @author Sam Detor (sam.detor@yale.edu)
 * @brief  This file manages the recieving of data from the bluetooth module using the packet structure explained in DataTransmission.h
 * @version 0.1
 * @date 2023-08-03
 * 
 * @copyright Copyright (c) 2023
 * 
 */

//Includes
#include "DataTransmission.h"

//Global Vars
uint8_t expectedPacketSign = EVEN;

//Local typedefs
typedef enum receiveCase {
    RECIEVE, PROCESS_PACKET, RESPOND
} ReceiveCase;

//Function declarations
int respond(CommsPacket* packetToSend, ReceiveCase *state, int* timesTried, int fd);
int processPacket(uint8_t *packet, uint8_t *dataBuff, size_t size, size_t* placeholder, CommsPacket *packetToSend, uint8_t* started, uint8_t* corruptData);


/**
 * @brief User facing method to receive data sent over UART with the "send" method using packet structures and sending protocols defined in 
 *        RecieveData.c and SendData.c. Assumes a correctly initialized Hal UART system, will not do any checks to ensure this
 * @param data the data buf to store the received data in 
 * @param size the size of the data buf
 * @param timeout_ms how long to wait for data before failing 
 * @param fd file descriptor for the open/correctly configured serial port 
 * @return 0 on pass and other on fail (see error code map in main.h for specific details)
 */
int receive(uint8_t * data, size_t size, size_t timeout_ms, int fd)
{
    //Variable defs
    CommsPacket packetToSend;
    uint8_t buffer[MAX_PACKET_SIZE];
    int ret;
    ReceiveCase state = RECIEVE;
    int timesTried = 0;
    size_t myPlaceholder = 0;
    uint8_t started = 0;
    uint8_t corruptData = 0;
    expectedPacketSign = EVEN;
    
    //Repeat this cycle until one of the helper methods signals to stop
    while(1)
    {
        switch (state)
        {
            case RECIEVE: //waits for data, receives it, and copies it into buffer
                ret = receivePacket(buffer,timeout_ms, fd);
                if (ret == TIMEOUT) //means the function timed out, 0 data was received
                {
                    return ret;
                }
                else if (ret == DATA_CORRUPTION) //corrupt data was received
                {
                    state = RESPOND;
                    packetToSend = badPacket;
                }
                else {
                    state = PROCESS_PACKET; //normal data was received, continue on to next phase
                }
            break;

            case PROCESS_PACKET: //checks for data corruption, copies good data into the data buff, and chooses response packet 
                ret = processPacket(buffer, data, size, &myPlaceholder, &packetToSend, &started, &corruptData);
                if (ret < 0)
                {
                    fprintf(stderr, "Failed at PROCESS_PACKET\n");
                    return ret; //no room left in the data buff for storage or received to many "bad packet" warnings from sender
                }
                else if (ret == 1)
                {
                   return 0; //received end packet 
                }
                else
                {
                    state = RESPOND;
                }
            break;

            case RESPOND: //based on previous packets sent, decides whether to respond or fail
                ret = respond(&packetToSend, &state, &timesTried, fd);
                if (ret < 0)
                {
                    fprintf(stderr, "Failed at RESPONSE\n");
                    return ret; //either failed to send or attempted to respond too many times
                }
            break;

            default:
                //weirdness has occured
                return UNKNOWN_ERROR; //unknown error
        }
    }
    return UNKNOWN_ERROR;
}

/**
 * @brief Helper method called inside receive, if no data is sent within timeout_ms, it will fail. If data is sent, it receives the data,
 *        un-stuffs the bytes, and stores it in buffer, provided there are no errors with the data received
 * 
 * @param buffer where the received packet will be stored, MUST be of size MAX_PACKET_SIZE
 * @param timeout_ms how long after recieving no data (in ms) before failing
 * @param fd file descriptor for the open/correctly configured serial port
 * @return 0 on pass and other on fail (see error code map in main.h for specific details)
 */
int receivePacket(uint8_t buffer[MAX_PACKET_SIZE], size_t timeout_ms, int fd)
{
    //variable defs
    size_t placeholder = 0;
    uint8_t escaped = 0;
    uint8_t byteRecieved;
    int flagBytesRead = 0;
    struct timeval timeStart;
    struct timeval timeNow;
    double time_elapsed = 0;
    int ret;

    //get start time
    gettimeofday(&timeStart, NULL);
    
    while ((flagBytesRead < 4) && (time_elapsed < timeout_ms)) //while you haven't received a full packet
    {
        ssize_t r = read(fd, &byteRecieved, 1); //read a byte from the port
        if (r > 0)
        {
            printf("ByteRecieved: %02X\n", byteRecieved);
            ret = readStuffed(buffer, MAX_PACKET_SIZE, &placeholder, byteRecieved, &escaped); //unstuffs the received bytes and saves them in the buffer provided
            if (ret < 0)
            {
                int result = tcflush(fd, TCIOFLUSH);  // Flush away any bytes previously written but not read to the port (for both the sender and receiver).
                if (result)                           // There could be bytes to read after the error has been detected that will mess up future packets
                {
                    perror("tcflush failed");  // just a warning, not a fatal error
                }
                flagBytesRead = ret;
                break;
            }
            flagBytesRead += ret;
        }
        else if (r < 0)
        {
            perror("failed to read from port");
            return FAILED_TO_READ;
        }
        
        //get new time
        gettimeofday(&timeNow, NULL);
        time_elapsed = getTimeDiff_ms(timeStart, timeNow); // gets time elapsed in ms
    }
    if(flagBytesRead < 4)              //readStuffed returns 1 for flag bytes, 0 for normal bytes, and -1 for errors                  
    {                                  //if flagBytesRead == 4 after the while loop, that indicates a packet was received correctly 
        if(flagBytesRead == 0)         //if flagBytesRead == 0 after the while loop, this indicates no data was received and so the method fails due to timeout
        {                              // if flagBytesRead doesn't equal 4 or 0, this indicates some sort of data corruption has happened
            return TIMEOUT; //timeout
        }
        return DATA_CORRUPTION; //data corruption
    }

    return 0;
}

/**
 * @brief Takes a correctly received packet in "packet", checks to make sure the packet is valid, stores data in "dataBuff" if necessary, 
 *        and then decides how to respond to sender .
 * 
 * @param packet the buffer holding the received packet
 * @param dataBuff the buffer where we store all received data 
 * @param size the size of "dataBuff"
 * @param placeholder a pointer to a size_t variable that keeps track of the next empty space in "dataBuff" to store data 
 * @param packetToSend a pointer to a CommsPacket variable that stores the response packet that will be sent to the sender 
 * @param started a pointer to a variable indicating if the start packet has been received 
 * @param corruptData a pointer to a variable indicating if the receiver has previously received a "bad packet" response from sender 
 * @return 0 on normal packet, 1 on end packet, and other on fail (see error code map in main.h for specific details)
 */
int processPacket(uint8_t *packet, uint8_t *dataBuff, size_t size, size_t* placeholder, CommsPacket *packetToSend, uint8_t* started, uint8_t* corruptData)
{
    //variable defs
    int ret;
    size_t i;
    Header * header = (Header *) packet;
    
    //Parse packet ensure its valid
    ret = parseMessage(packet);

    //if packet is invalid
    if (ret < 0)
    {
        *packetToSend = badPacket;
        return 0;
    }
    
    //checking if it is the endPacket
    if(header->cmd == END_PACKET)
    {
        return 1;
    }
    else if (header->cmd == START_PACKET && *started == 0) //if the start packet has not been received and if the current packet is the start packet
    {
        *packetToSend = ackPacket;
        *started = 1;
        return 0;
    }
    else if (header->cmd == START_PACKET && *started == 1) //if the start packet was received but the current packet is also the start packet, that shouldn't happen
    {
        *packetToSend = badPacket;
        return 0;
    }
    else if(*started == 0 && header->cmd != START_PACKET) //if the start packet has not been received
    {
        //first packet should be start packet
        *packetToSend = badPacket;
        return 0;
    }
    else if(header->cmd == BAD_PACKET) //if BAD_PACKET has been received
    {
        if (*corruptData == 0) //if we haven't sent corrupt data yet
        {
            *corruptData += 1;
            return 0; //don't store the data, send the same packet you tried to before
        }
        else
        {
            fprintf(stderr, "Failed: received \"bad packet\" too many times from sender\n");
            return MANY_FAILS;
        }
    }
    else if(header->cmd != expectedPacketSign) //duplicated data received, discarding and responding with ack packet
    {
        *packetToSend = ackPacket;
        return 0;
    }

    //updating the expectedPacketSign (keeps track of if duplicated data is sent or not)
    if(expectedPacketSign == EVEN)
    {
        expectedPacketSign = ODD;
    }
    else
    {
        expectedPacketSign = EVEN;
    }
    
    //checking there is room in the dataBuff;
    if ((*placeholder + header->length) > size)
    {
        fprintf(stderr, "Failed: no more space to store bytes in given databuff\n");
        return NO_STORAGE; //unable to store the data
    }
    
    //storing the data in "dataBuff"
    for(i = 0; i < header->length; i++)
    {
        dataBuff[*placeholder + i] = packet[PREAMBLE_SIZE + i];
    }

    *placeholder += (size_t) header->length; //updating the placeholder
    *packetToSend = ackPacket; //will acknowlege the correctly received packet
    return 0;
}

/**
 * @brief Decides whether to send the response packet and what state of the recieving process to return to, or fails
 * 
 * @param packetToSend response packet to send, chosen by processPacket
 * @param state a pointer to the current state of the recieving process 
 * @param timesTried a pointer to the amount of times sending has failed and/or a "badPacket" response has been sent in a row 
 * @param fd file descriptor for the open/correctly configured serial port
 * @return returns 0 on sucess/normal operation, and other on fail (see error code map in main.h for specific details) 
 */
int respond(CommsPacket* packetToSend, ReceiveCase* state, int* timesTried,int fd)
{
    //variable defs
    int ret;

    //if the packet to send is an acknowlagement, and things have gone wrong at most twice
    if(packetToSend->cmd == ACK_PACKET && *timesTried < 2)
    {
        *state = RECIEVE; //the next state of the recieving process
        
        ret = sendPacket((uint8_t *) packetToSend, OVERHEAD, fd);
        if (ret < 0 && *timesTried == 0) //if the sending failed and nothing has gone wrong before
        {
            //try again
            *timesTried += 1;
            *state = RESPOND;
            return 0;
        }
        else if (ret < 0) //if the sending failed and something has gone wrong before
        {
            fprintf(stderr, "Failed to send response packet\n");
            return FAILED_TO_SEND; //fail
        }

        //re-set the timesTried var if all has gine well
        *timesTried = 0;
        return 0;
    }
    //if the packet to send is a "badPacket" and nothing has gone wrong
    else if (*timesTried == 0)
    {
        *timesTried += 1; //record that the bad packet has been sent
        *state = RECIEVE;
        ret = sendPacket((uint8_t *) packetToSend, OVERHEAD, fd);
        if (ret < 0) //if a second thing went wrong
        {
            fprintf(stderr, "Failed to send response packet\n");
            return FAILED_TO_SEND; //fail
        }
        return 0;
    }
    else
    {
         fprintf(stderr, "Failed to communicate with sender too many times\n");
        return MANY_FAILS; //too many attempts made/things went wrong, fail out
    }
}

/**
 * @brief This method tries to receive the initial ping from the board. If a packet is received, it
 *        checks the packet for data corruption and makes sure its the start packet. If this method
 *        returns 0, it means the ping from the board has been correctly received.
 * 
 * @param buffer a uint8_t array of MAX_PACKET_SIZE to store the received packet in
 * @param timeout_ms how long receivePing should wait before timing out in miliseconds 
 * @param fd file descriptor for the open/correctly configured serial port 
 * @return 0 on sucess, other on failure (see error code map in main.h for specific details)
 */
int receivePing(uint8_t buffer[MAX_PACKET_SIZE], size_t timeout_ms, int fd)
{
    //variables definitions
    int ret;
    
    ret = receivePacket(buffer,timeout_ms,fd); //try to receive a packet from the board
    if (ret < 0) //if it failed
    {
        if (ret == DATA_CORRUPTION) //when receiving data from the bluetooth module, there is a lot of noise/garbage characters
        {                           //sent before the actual data, so I wanted to treat this type of data corruption as less serious
            return TIMEOUT;         //than the types detected in parseMessage, so if receivePacket detects data corruption, 
                                    //it will be treated as a timeout (AKA just try again), not a fail (which would mean an exit/step towards and exit)
        }
        return ret;
    }
    ret = parseMessage(buffer); //parsing the correctly received packet for corruption
    if (ret < 0)
    {
        return ret;
    }
    if(((CommsPacket*)buffer)->cmd == START_PACKET) //if it is a start packet, success!
    {
        return 0;
    }
    else
    {
        return UNKNOWN_ERROR;
    }

}
