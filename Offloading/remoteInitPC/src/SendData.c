//Include statements
#include "PacketHandling.h"

//enum declaration 
enum SendCase {
    MAKE_PACKET, SEND_PACKET, WAIT
};

/**
 * @brief Get the next packet from the data buffer at the location *placeholder.
 * 
 * @param data the data to make packets from 
 * @param placeholder pointer to the variable that indicates the starting point for the next packet in "data" 
 * @param buffer array to store next packet, MUST be of size MAX_PACKET_SIZE, method assumes this 
 * @param size size of the data
 * @return 0 on sucess, other on failure (see error codes map for more details) 
 */
int getPacketFromData(uint8_t *data, size_t* placeholder, uint8_t buffer[MAX_PACKET_SIZE], size_t size) 
{
    //variable defs
    Header* header = (Header*)buffer;
    Footer* footer;
    int dataInPacket;
    
    //Validity checks
    if (*placeholder >= size)  // placeholder needs to be < size
    {
        fprintf(stderr, "Failed: placeholder >= size\n");
        return NO_STORAGE;
    }
    if (*placeholder < 0 || size < 0)  // size and placeholder must be positive
    {
        fprintf(stderr, "Failed: placeholder or size out of range\n");
        return NO_STORAGE;
    }
    if (size == 0)  //size can't be 0
    {
        fprintf(stderr, "Failed: size = 0\n");
        return NO_STORAGE;
    }

    //calculating data amount in packet
    if((size - *placeholder) >= FRAME_DATA_FIELD_SIZE)
    {
        dataInPacket = FRAME_DATA_FIELD_SIZE; //max data size in packet
    }
    else 
    {
        dataInPacket = size - *placeholder;
    }
    
    //copying the data into the packet
    for (int i = 0; i < dataInPacket; i++)
    {
        buffer[PREAMBLE_SIZE + i] = data[*placeholder + i];
    }

    //filling in the header data fields
    header->header = PREAMBLE;
    header->cmd = 0;
    header->length = dataInPacket;
    
   
    //filling in postamble
    footer = (Footer*)(buffer + PREAMBLE_SIZE + dataInPacket);
    calculateFletchersChecksum(buffer,dataInPacket, &(footer->checksum1), &(footer->checksum2));
    footer->footer = POSTAMBLE;

    //update placeholder
    *placeholder += dataInPacket;
    return 0;

}

/**
 * @brief Waits for "timeout_ms" amount of CPU time for a response from the reciever. If a response is recieved, it parses the response and 
 *        decides what part of the sending workflow to return to
 * @param timeout_ms amount of CPU time (in ms) to wait for an acknowlagement 
 * @param ackBuffer the buffer where the response will be stored 
 * @param state pointer to the state variable which holds the current state of the sending process 
 * @param fd file descriptor for an open/correctly configured port 
 * @param timesTriedToSend pointer to a variable which holds how many times a given packet has tried to be sent 
 * @return 0 on sucess, other on failure (see error codes for more details) 
 */
int waitForAck(size_t timeout_ms, uint8_t ackBuffer[OVERHEAD], enum SendCase* state, int fd, int* timesTriedToSend)
{
    //variable defs
    struct timeval timeStart;
    struct timeval timeNow;
    double time_elapsed = 0;
    uint8_t byteRecieved;
    int flagBytesRead = 0;
    int ret;
    size_t placeholder = 0;
    uint8_t escaped = 0;
    int bytesRead = 0;
    CommsPacket* recievedPacket;

    //get startTime
    gettimeofday(&timeStart, NULL);

    //Receiving the Comms packet
    while (time_elapsed < timeout_ms)
    {
        ssize_t r = read(fd, &byteRecieved, 1);
        if (r < 0)
        {
            perror("failed to read from port");
            return FAILED_TO_READ;
        }
        else if (r == 0)
        {
        // Timeout
        }
        else 
        {
            ret = readStuffed(ackBuffer, OVERHEAD, &placeholder, byteRecieved, &escaped); //returns 1 if read a flag byte, 0 on normal byte, -1 on error
            if (ret < 0) //if something went wrong
            {
                int result = tcflush(fd, TCIOFLUSH);  // Flush away any bytes previously written but not read to the port (for both the sender and reciever).
                if (result)                           // There could be bytes to read after the error has been detected that will mess up future packets
                {
                    perror("tcflush failed");  // just a warning, not a fatal error
                }
                flagBytesRead = ret;
                break;
            }
            else //all went well
            {
                flagBytesRead += ret;
                bytesRead++;
            }

            if (flagBytesRead == 4 || bytesRead >= 8) //four flag bytes indicate a complete packet, 8 bytes also indicate a complete comms packet (trying to get it to fail as fast as possible)
            {
                break;
            }
        }

        gettimeofday(&timeNow, NULL);
        time_elapsed = getTimeDiff_ms(timeStart, timeNow); // gets time elapsed in ms
    }
    
    //Determining the response based on the recieved packet

    //Timeout, ie no packet recieved
    if (flagBytesRead == 0) 
    {
        if (*timesTriedToSend < 1) //if something hasn't gone wrong yet, re-send packet
        {
            *state = SEND_PACKET;
            *timesTriedToSend += 1;
            return 0;
        }
        else //didn't acknowlage two attempts to send the packet, fail 
        {
            fprintf(stderr, "Failed: Didn't recieve acknowlagement after 2nd attempt to send packet\n");
            return MANY_FAILS;
        }
    }

    //Checking recieved data to make sure it's valid
    if (flagBytesRead > 0)
    {
        ret = parseMessage(ackBuffer);
    }
    
    //if readStuffed method or the parseMessage methods detected an error, or if the packet recieved is not a Comms packet, respond with "bad packet"
    if (flagBytesRead < 0 || ret < 0 || ((CommsPacket *) ackBuffer)->cmd == 0)
    {
        printf("Warning: recieved invalid packet\n");

        if (*timesTriedToSend > 1) //if something has previously gone wrong, fail
        {
            fprintf(stderr, "Failed to send data too many times, recieved an invalid acknowlagement\n");
            return MANY_FAILS;
        }
        else
        {
            ret = sendCommsPacket(BAD_PACKET, fd); //if this is the first thing to go wrong, send bad packet, then wait for a response from reciever
            if(ret < 0)
            {
                fprintf(stderr, "Failed to send data too many times, recieved an invalid acknowlagement\n");
                return MANY_FAILS;
            }

            *timesTriedToSend += 1;
            *state = WAIT;
            return 0;
        }
    }
        
    recievedPacket = (CommsPacket *) ackBuffer;
    
    if (recievedPacket->cmd == ACK_PACKET) //if the packet recieved was an acknowlagement
    {
        *timesTriedToSend = 0; //re-set fails counter
        *state = MAKE_PACKET; //return to start of send workflow
        return 0;
    }
    else if (recievedPacket->cmd == BAD_PACKET) //if the packet recieved was a bad packet 
    {
        if(*timesTriedToSend < 2) //if things have gone wrong no more than once, resend packet
        {
            *state = SEND_PACKET;
            *timesTriedToSend += 1;
            return 0;
        }
        else // if things have already gone wrong once with this packet, fail
        {
            fprintf(stderr,"Failed to send data too many times, recieved a bad packet comms from reciever\n");
            return MANY_FAILS;
        }
        
    }
    return 0;
}

/**
 * @brief The user facing method for sending data over UART, using the data/packet structure outlined in DataTransmission.h. This method assumes
 *        an open/well initialized port.
 * @param data the data to send
 * @param timeout_ms how long to wait for an acknowlagement from the reciever before failing
 * @param size size of the data 
 * @param fd fd of the port to send things from 
 * @return returns 0 on sucess other on failure (see error code map for more details) 
 */
int send(uint8_t *data, size_t timeout_ms, size_t size, int fd)
{
    //variable defs
    size_t placeholder = 0;
    int timesTriedToSend = 0;
    uint8_t buffer[MAX_PACKET_SIZE];
    uint8_t ackBuffer[OVERHEAD];
    int ret;
    enum SendCase state = WAIT;
    int lengthOfPacket;
    int end = 0;

    //send the start packet
    ret = sendCommsPacket(START_PACKET, fd);
    if (ret < 0)
    {
        fprintf(stderr, "Failed: Start packet failed to send\n");
        return FAILED_TO_SEND;
    }

    //put the start packet in the buffer, in case you have to re-send it
    for(int i = 0; i < OVERHEAD; i++)
    {
        buffer[i] = ((uint8_t *) &startPacket)[i];
    }
    
    //The while loop getting and sending each packet, ends when the last packet has been acknowlaged
    while(end == 0) 
    {
        switch(state) {
            case MAKE_PACKET: //Get the next packet from the data buffer according to the value of placeholder
                ret = getPacketFromData(data, &placeholder, buffer, size);
                if (ret < 0)
                {
                    fprintf(stderr, "Failed at MAKE_PACKET: Unable to get a useable data packet from data provided\n");
                    return ret;
                }
                state = SEND_PACKET;
                break;
            
            case SEND_PACKET: //stuff the bytes of and send the previously gotten packet
                lengthOfPacket = ((Header*)buffer)->length + OVERHEAD;
                ret = sendPacket(buffer,lengthOfPacket,fd);
                if (ret < 0)
                {
                    fprintf(stderr, "Failed at SEND_PACKET: Unable to send packet\n");
                    return FAILED_TO_SEND;
                }
                state = WAIT;
                break;

            case WAIT: //wait for the acknowlagement and either timeout or decide what phase of the sending process to return to
                ret = waitForAck(timeout_ms, ackBuffer, &state, fd, &timesTriedToSend);
                if (ret < 0)
                {
                    fprintf(stderr, "Failed at WAIT: Didn't recieve proper acknowlagement\n");
                    return -1;
                }
                if (placeholder >= size && state == MAKE_PACKET) //the last data packet has been acknowledged
                {
                    end = 1;
                }
                break;

            default:
                fprintf(stderr, "Something went way weird\n");
                return -1;
                break;
        }
    }

    //send the end packet
    ret = sendCommsPacket(END_PACKET, fd);
    if (ret < 0)
    {
        fprintf(stderr, "Failed: End packet failed to send\n");
        return FAILED_TO_SEND;
    }
    
    return 0;
}
