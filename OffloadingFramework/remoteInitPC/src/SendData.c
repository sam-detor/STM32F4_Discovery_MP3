/**
 * @file RecieveData.c
 * @author Sam Detor (sam.detor@yale.edu)
 * @brief  This file manages the sending of data to the bluetooth module using the packet structure explained in DataTransmission.h
 * @version 0.1
 * @date 2023-08-03
 * 
 * @copyright Copyright (c) 2023
 * 
 */

//Include statements
#include "DataTransmission.h"

static void calculateFletchersChecksumNew(uint8_t* buffer, uint32_t dataLen, uint8_t* check1, uint8_t* check2);

//enum declaration 
enum SendCase {
    MAKE_PACKET, SEND_PACKET, WAIT
};

//globalVar
//This variable holds the current data packet sign, which is used by the receiver to detect dropped data
uint8_t currentPacketSign = EVEN;

/**
 * @brief Get the next packet from the data buffer at the location *placeholder.
 * 
 * @param data the data to make packets from 
 * @param placeholder pointer to the variable that indicates the starting point for the next packet in "data" 
 * @param buffer uint8_t array to store next packet, MUST be of size MAX_PACKET_SIZE, method assumes this 
 * @param size size of the data
 * @return 0 on sucess, other on failure (see error code map in main.h for specific details) 
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
    header->cmd = currentPacketSign;
    header->length = dataInPacket;

    //updating packet sign, this is to for the reciever to use to detect duplicated data
    if (currentPacketSign == EVEN)
    {
        currentPacketSign = ODD;
    }
    else
    {
        currentPacketSign = EVEN;
    }
    
   
    //filling in postamble //CHECKSUM CHANGE
    footer = (Footer*)(buffer + PREAMBLE_SIZE + dataInPacket);
    calculateFletchersChecksum(buffer,dataInPacket, &(footer->checksum1), &(footer->checksum2));
    footer->footer = POSTAMBLE;

    //update placeholder
    *placeholder += dataInPacket;
    return 0;

}

/**
 * @brief Waits for "timeout_ms" for a response from the receiver. If a response is received, it parses the response and 
 *        decides what part of the sending workflow to return to
 * @param timeout_ms amount time (in ms) to wait for an acknowlagement 
 * @param ackBuffer the uint8_t buffer of size OVERHEAD where the response will be stored 
 * @param state pointer to the state variable which holds the current state of the sending process 
 * @param fd file descriptor for an open/correctly configured port 
 * @param timesTriedToSend pointer to a variable which holds how many times a given packet has tried to be sent 
 * @return 0 on sucess, other on failure (see error code map in main.h for specific details)
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
    CommsPacket* receivedPacket;

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
                int result = tcflush(fd, TCIOFLUSH);  // Flush away any bytes previously written but not read to the port (for both the sender and receiver).
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
    
    //Determining the response based on the received packet

    //Timeout, ie no packet received
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
            fprintf(stderr, "Failed: Didn't receive acknowlagement after 2nd attempt to send packet\n");
            return MANY_FAILS;
        }
    }

    //Checking received data to make sure it's valid
    if (flagBytesRead > 0)
    {
        ret = parseMessage(ackBuffer);
    }
    
    //if readStuffed method or the parseMessage methods detected an error, or if the packet received is not a Comms packet, respond with "bad packet"
    if (flagBytesRead < 0 || ret < 0 || ((CommsPacket *) ackBuffer)->cmd == NO_CMD || ((CommsPacket *) ackBuffer)->cmd == EVEN || ((CommsPacket *) ackBuffer)->cmd == ODD)
    {
        printf("Warning: received invalid packet\n");

        if (*timesTriedToSend > 1) //if something has previously gone wrong, fail
        {
            fprintf(stderr, "Failed to send data too many times, received an invalid acknowlagement\n");
            return MANY_FAILS;
        }
        else
        {
            ret = sendCommsPacket(BAD_PACKET, fd); //if this is the first thing to go wrong, send bad packet, then wait for a response from receiver
            if(ret < 0)
            {
                fprintf(stderr, "Failed to send data too many times, received an invalid acknowlagement\n");
                return MANY_FAILS;
            }

            *timesTriedToSend += 1;
            *state = WAIT;
            return 0;
        }
    }
        
    receivedPacket = (CommsPacket *) ackBuffer;
    
    if (receivedPacket->cmd == ACK_PACKET) //if the packet received was an acknowlagement
    {
        *timesTriedToSend = 0; //re-set fails counter
        *state = MAKE_PACKET; //return to start of send workflow
        return 0;
    }
    else if (receivedPacket->cmd == BAD_PACKET) //if the packet received was a bad packet 
    {
        if(*timesTriedToSend < 2) //if things have gone wrong no more than once, resend packet
        {
            *state = SEND_PACKET;
            *timesTriedToSend += 1;
            return 0;
        }
        else // if things have already gone wrong once with this packet, fail
        {
            fprintf(stderr,"Failed to send data too many times, received a bad packet comms from receiver\n");
            return MANY_FAILS;
        }
        
    }
    return 0;
}

/**
 * @brief The user facing method for sending data to the bluetooth module, using the data/packet structure outlined in DataTransmission.h. This method assumes
 *        an open/well initialized port.
 * @param data the data to send
 * @param timeout_ms how long to wait for an acknowlagement from the receiver before failing
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
    currentPacketSign = EVEN;

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
            
            case SEND_PACKET: //byte stuff and send the previously gotten packet
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
                    fprintf(stderr, "Failed at WAIT: Didn't receive proper acknowlagement\n");
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

/**
 * @brief Calculating the Fletchers Checksum for the given packet. DOES NO CHECKS TO ENSURE DATALEN IS ACCURATE
 * 
 * @param buffer the packet that the checksums are going to be calculated off of 
 * @param dataLen the amount of data in the packet 
 * @param check1 pointer a uint8_t where you want checksum 1 to be stored 
 * @param check2 pointer to a uint8_t where you want checksum 2 to be stored  
 * @return 0, assumes dataLen is accurate 
 */
#pragma GCC push_options
#pragma GCC optimize ("no-peel-loops")
static void calculateFletchersChecksumNew(uint8_t* buffer, uint32_t dataLen, uint8_t* check1, uint8_t* check2)
{
    // Variable defs
    uint32_t packetLength = dataLen + PREAMBLE_SIZE;
    uint8_t c1 = 0;
    uint8_t c2 = 0;

    // Calculating the checksums
    for (uint32_t i = 0; i < packetLength; i++)
    {
        c1 += buffer[i];
        c2 += c1;
    }

    // Storing there values in the pointers given
    *check1 = c1;
    *check2 = c2;
}
#pragma GCC pop_options
