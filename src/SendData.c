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
    int i;
    
    //Validity checks
    if (*placeholder >= size)  // placeholder needs to be < size
    {
        return NO_STORAGE;
    }
    if (*placeholder < 0 || size < 0)  // size and placeholder must be positive
    {
        return NO_STORAGE;
    }
    if (size == 0)  //size can't be 0
    {
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
    for (i = 0; i < dataInPacket; i++)
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
    *placeholder += (size_t) dataInPacket;
    return 0;

}

/**
 * @brief Waits for "timeout_ms" amount of CPU time for a response from the reciever. If a response is recieved, it parses the response and 
 *        decides what part of the sending workflow to return to
 * @param timeout_ms amount of CPU time (in ms) to wait for an acknowlagement 
 * @param ackBuffer the buffer where the response will be stored 
 * @param state pointer to the state variable which holds the current state of the sending process 
 * @param USARTx UART_TypeDef for the correctly configured UART connection
 * @param timesTriedToSend pointer to a variable which holds how many times a given packet has tried to be sent 
 * @return 0 on sucess, other on failure (see error codes for more details) 
 */
int waitForAck(size_t timeout_ms, uint8_t ackBuffer[OVERHEAD], enum SendCase* state, USART_TypeDef* USARTx, int* timesTriedToSend)
{
    //variable defs
    uint8_t byteRecieved;
    int flagBytesRead = 0;
    int ret = 0;
    size_t placeholder = 0;
    uint8_t escaped = 0;
    CommsPacket* recievedPacket;


    while (flagBytesRead < 4) //while you haven't recieved a full packet
    {
        volatile int ret = HAL_UART_Receive(USARTx, &byteRecieved, 1, timeout_ms);
        if (ret == 0)
        {
            ret = readStuffed(ackBuffer, &placeholder, byteRecieved, &escaped); //unstuffs the recieved bytes and saves them in the buffer provided
            flagBytesRead += ret;
        }
        else if (ret == TIMEOUT)
        {
            break; //been timeout_ms since recieving last data point
        }
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
            return MANY_FAILS;
        }
    }

    //Checking recieved data to make sure it's valid
    if (flagBytesRead > 0)
    {
        ret = parsePacket(ackBuffer);
    }
    
    //if readStuffed method or the parsePacket methods detected an error, or if the packet recieved is not a Comms packet, respond with "bad packet"
    if (flagBytesRead < 0 || ret < 0 || ((CommsPacket *) ackBuffer)->cmd == 0)
    {

        if (*timesTriedToSend > 1) //if something has previously gone wrong, fail
        {
            return MANY_FAILS;
        }
        else
        {
            ret = sendPacket((uint8_t*) &badPacket, OVERHEAD, USARTx); //if this is the first thing to go wrong, send bad packet, then wait for a response from reciever
            if(ret < 0)
            {
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
 * @param USARTx UART_TypeDef for the correctly configured UART connection
 * @return returns 0 on sucess other on failure (see error code map for more details) 
 */
int send(uint8_t *data, size_t timeout_ms, size_t size, USART_TypeDef* USARTx)
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
    int i;

    //send the start packet
    ret = sendPacket((uint8_t*) &startPacket, OVERHEAD, USARTx);
    if (ret < 0)
    {
        return FAILED_TO_SEND;
    }

    //put the start packet in the buffer, in case you have to re-send it
    for(i = 0; i < OVERHEAD; i++)
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
                    return ret;
                }
                state = SEND_PACKET;
                break;
            
            case SEND_PACKET: //stuff the bytes of and send the previously gotten packet
                lengthOfPacket = ((Header*)buffer)->length + OVERHEAD;
                ret = sendPacket(buffer,lengthOfPacket, USARTx);
                if (ret < 0)
                {
                    return FAILED_TO_SEND;
                }
                state = WAIT;
                break;

            case WAIT: //wait for the acknowlagement and either timeout or decide what phase of the sending process to return to
                ret = waitForAck(timeout_ms, ackBuffer, &state, USARTx, &timesTriedToSend);
                if (ret < 0)
                {
                    return -1;
                }
                if (placeholder >= size && state == MAKE_PACKET) //the last data packet has been acknowledged
                {
                    end = 1;
                }
                break;

            default:
                return -1;
                break;
        }
    }

    //send the end packet
    ret = sendPacket((uint8_t*) &endPacket, OVERHEAD, USARTx);
    if (ret < 0)
    {
        return FAILED_TO_SEND;
    }
    
    return 0;
}
