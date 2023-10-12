/**
 * @file RecieveData.c
 * @author Sam Detor (sam.detor@yale.edu)
 * @brief  This file manages the recieving of data over UART using the packet structure explained in RecieveData.h
 * @version 0.1
 * @date 2023-08-03
 * 
 * @copyright Copyright (c) 2023
 * 
 */
#include "RecieveData.h"

//Global Variables
//this variable is used to detect duplicated data from the sender, if the data packet has an unexpected sign, it will be ignored
uint8_t expectedPacketSign = EVEN;

//Comms packets
CommsPacket ackPacket = {header: 0x7e7e, cmd: ACK_PACKET, length: 0, checksum1: 253, checksum2: 119, footer: 0x7e7e};
CommsPacket badPacket = {header: 0x7e7e, cmd: BAD_PACKET, length: 0, checksum1: 254, checksum2: 121, footer: 0x7e7e};
CommsPacket endPacket = {header: 0x7e7e, cmd: END_PACKET, length: 0, checksum1: 0, checksum2: 123, footer: 0x7e7e};
CommsPacket startPacket = {header: 0x7e7e, cmd: START_PACKET, length: 0, checksum1: 1, checksum2: 125, footer: 0x7e7e};

//Function declarations

int respond(CommsPacket* packetToSend, ReceiveCase *state, int* timesTried, USART_TypeDef* USARTx);
int processPacket(uint8_t *packet, uint8_t *dataBuff, size_t size, size_t* placeholder, CommsPacket *packetToSend, uint8_t* started, uint8_t* corruptData, size_t* bytesRecieved);
int readStuffed(uint8_t buffer[MAX_PACKET_SIZE], size_t* placeholder, uint8_t byteRecieved, uint8_t* escaped);
int parsePacket(uint8_t* buffer);
int calculateFletchersChecksum(uint8_t* buffer, int dataLen, uint8_t* check1, uint8_t* check2);
int sendPacket(uint8_t * buffer, uint32_t size, USART_TypeDef* USARTx);
int recievePacket(uint8_t buffer[MAX_PACKET_SIZE], size_t timeout_ms, USART_TypeDef* USARTx);

//Implementations

/**
 * @brief User facing method to recieve data sent over UART with the "send" method using packet structures and sending protocols defined in 
 *        RecieveData.c and SendData.c. Assumes a correctly initialized Hal UART system, will not do any checks to ensure this
 * @param data the data buf to store the recieved data in 
 * @param size the size of the data buf
 * @param timeout_ms how long to wait for data before failing 
 * @param USARTx a pointer to a correctly initialized UART_TypeDef  
 * @return 0 on pass and other on fail (see error code map in RecieveData.h for specific details)
 */
int recieve(uint8_t * data, size_t size, size_t timeout_ms, USART_TypeDef* USARTx, size_t* bytesRecieved)
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
    expectedPacketSign = EVEN; //resetting this var at start of send/recieve

    //zeroing bytes recieved
    *bytesRecieved = 0;
    
    //Repeat this cycle until one of the helper methods signals to stop
    while(1)
    {
        switch (state)
        {
            case RECIEVE: //waits for data, recieves it, and copies it into buffer
                ret = recievePacket(buffer,timeout_ms, USARTx);
                if (ret == TIMEOUT) //means the function timed out, 0 data was recieved
                {
                    return ret;
                }
                else if (ret == DATA_CORRUPTION) //corrupt data was recieved
                {
                    state = RESPOND;
                    packetToSend = badPacket;
                }
                else {
                    state = PROCESS_PACKET; //normal data was recieved, continue on to next phase
                }
            break;

            case PROCESS_PACKET: //checks for data corruption, copies good data into the data buff, and chooses response packet 
                ret = processPacket(buffer, data, size, &myPlaceholder, &packetToSend, &started, &corruptData, bytesRecieved);
                if (ret < 0)
                {
                    return ret; //no room left in the data buff for storage or recieved to many "bad packet" warnings from sender
                }
                else if (ret == 1)
                {
                   return 0; //recieved end packet 
                }
                else
                {
                    state = RESPOND;
                }
            break;

            case RESPOND: //based on previous packets sent, decides whether to respond or fail
                ret = respond(&packetToSend, &state, &timesTried, USARTx);
                if (ret < 0)
                {
                    return ret; //either failed to send or attempted to respond too many times
                }
            break;

            default:
                //weirdness has occured
                return UNKNOWN_ERROR;
        }
    }
    return 0;
}

/**
 * @brief Helper method called inside recieve, if no data is sent within timeout_ms, it will fail. If data is sent, it recieves the data,
 *        un-stuffs the bytes, and stores it in buffer, provided there are no errors with the data recieved
 * 
 * @param buffer where the recieved packet will be stored, MUST be of size MAX_PACKET_SIZE
 * @param timeout_ms how long after recieving no data (in ms) before failing
 * @param USARTx a pointer to a correctly initiazlized UART_TypeDef 
 * @return 0 on pass and other on fail (see error code map in RecieveData.h for specific details)
 */
int recievePacket(uint8_t buffer[MAX_PACKET_SIZE], size_t timeout_ms, USART_TypeDef* USARTx)
{
    //variable defs
    size_t placeholder = 0;
    uint8_t escaped = 0;
    uint8_t byteRecieved;
    int flagBytesRead = 0;
    
    while (flagBytesRead < 4) //while you haven't recieved a full packet (two flag bytes are in the preamble and 2 are in the postamble)
    {
        volatile int ret = HAL_UART_Receive(USARTx, &byteRecieved, 1, timeout_ms);
        if (ret == 0) //if you recieved a byte
        {
            ret = readStuffed(buffer, &placeholder, byteRecieved, &escaped); //unstuffs the recieved bytes and saves them in the buffer provided
            flagBytesRead += ret;
        }
        else if (ret == TIMEOUT)
        {
            break; //been timeout_ms since recieving last data point
        }
    }
    if(flagBytesRead < 4)                 //readStuffed returns 1 for flag bytes, 0 for normal bytes, and -1 for errors                  
    {                                     //if flagBytesRead == 4 after the while loop, that indicates a packet was recieved correctly 
        if(flagBytesRead == 0)            //if flagBytesRead == 0 after the while loop, this indicates no data was recieved and so the method fails due to timeout
        {                                 // if flagBytesRead doesn't equal 4 or 0, this indicates some sort of data corruption has happened
            return TIMEOUT; //timeout          // The method recieves all possible data from the sender before failing due to data corruption, this is done so that
        }                                      // when the reciever requests new data, the channel is clear to recieve it correctlty without the corrupt data interfering
        return DATA_CORRUPTION; //data corruption
    }

    return 0;
}

/**
 * @brief Takes a correctly recieved packet in "packet", checks to make sure the packet is valid, stores data in "dataBuff" if necessary, 
 *        and then decides how to respond to sender.
 * 
 * @param packet the buffer holding the recieved packet
 * @param dataBuff the buffer where we store all recieved data 
 * @param size the size of "dataBuff"
 * @param placeholder a pointer to a size_t variable that keeps track of the next empty space in "dataBuff" to store data 
 * @param packetToSend a pointer to a CommsPacket variable that stores the response packet that will be sent to the sender 
 * @param started a pointer to a variable indicating if the start packet has been recieved 
 * @param corruptData a pointer to a variable indicating if the reciever has previously recieved a "bad packet" response from sender 
 * @return 0 on normal packet, 1 on end packet, and other on fail (see error code map in RecieveData.h for specific details)
 */
int processPacket(uint8_t *packet, uint8_t *dataBuff, size_t size, size_t* placeholder, CommsPacket *packetToSend, uint8_t* started, uint8_t* corruptData, size_t* bytesRecieved)
{
    //variable defs
    int ret;
    size_t i;
    Header * header = (Header *) packet;
    
    //Parse packet ensure its valid
    ret = parsePacket(packet);

    //if packet is invalid, back packet will be eventually sent to the sender 
    if (ret < 0)
    {
        *packetToSend = badPacket;
        return 0;
    }
    
    //If it's the end packet, return 1
    if(header->cmd == END_PACKET)
    {
        return 1;
    }
    else if (header->cmd == START_PACKET && *started == 0) //if the start packet has not been recieved and if the current packet is the start packet
    {
        *packetToSend = ackPacket;
        *started = 1;
        return 0;
    }
    else if (header->cmd == START_PACKET && *started == 1) //if the start packet was recieved but the current packet is also the start packet
    {
        *packetToSend = badPacket; //only the first packet should be the start packet
        return 0;
    }
    else if(*started == 0 && header->cmd != START_PACKET) //if the start packet has not been recieved
    {
        //first packet should be start packet
        *packetToSend = badPacket;
        return 0;
    }
    else if(header->cmd == BAD_PACKET) //if BAD_PACKET has been recieved
    {
        if (*corruptData == 0) //if we haven't sent corrupt data yet
        {
            *corruptData += 1;
            return 0; //don't store the data, send the same packet you tried to before
        }
        else
        {
            return DATA_CORRUPTION; //failed to send correct data too many times 
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
        return NO_STORAGE; //unable to store the data
    }
    
    //storing the data in "dataBuff"
    for(i = 0; i < header->length; i++)
    {
        dataBuff[*placeholder + i] = packet[PREAMBLE_SIZE + i];
        *bytesRecieved += 1;
    }

    *placeholder += (size_t) header->length; //updating the placeholder var based on the data stored
    *packetToSend = ackPacket;
    return 0;
}



/**
 * @brief Decides whether to send the response packet and what state of the recieving process to return to, or fails
 * 
 * @param packetToSend response packet to send, chosen by processPacket
 * @param state a pointer to the current state of the recieving process 
 * @param timesTried a pointer to the amount of times sending has failed and/or a "badPacket" response has been sent in a row 
 * @param USARTx a pointer to a properply initialized UART_TypeDef
 * @return returns 0 on sucess/normal operation, and other on fail (see error code map for specific details) 
 */
int respond(CommsPacket* packetToSend, ReceiveCase* state, int* timesTried, USART_TypeDef* USARTx)
{
    //variable defs
    int ret;

    //if the packet to send is an acknowlagement, and things have gone wrong at most twice
    if(packetToSend->cmd == ACK_PACKET && *timesTried < 2)
    {
        *state = RECIEVE; //the next state of the recieving process
        
        ret = sendPacket((uint8_t *) packetToSend, OVERHEAD, USARTx);
        if (ret < 0 && *timesTried == 0) //if the sending failed and nothing has gone wrong before
        {
            //try again
            *timesTried += 1;
            *state = RESPOND;
            return 0;
        }
        else if (ret < 0) //if the sending failed and something has gone wrong before
        {
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
        ret = sendPacket((uint8_t *) packetToSend, OVERHEAD, USARTx);
        if (ret < 0) //if a second thing went wrong
        {
            return FAILED_TO_SEND; //fail
        }
        return 0;
    }
    else
    {
        return MANY_FAILS; //too many attempts made/things went wrong, fail out
    }
}

/**
 * @brief This method sends the start packet
 * 
 * @param USARTx a pointer to a properply initialized UART_TypeDef
 * @return 0 on sucess, and other on error (see error code map in RecieveData.h for more details)  
 */
int sendStartPacket(USART_TypeDef* USARTx)
{
    return sendPacket((uint8_t *) &startPacket, sizeof(startPacket), USARTx);
}

/**
 * @brief Takes a byte read from UART, un-stuffs it and stores the data in its unstuffed form in "buffer". For more details on the byte stuffing used,
 *        see the packet structure explanation in RecieveData.h
 * @param buffer a buffer to store the recieved unstuffed bytes in, MUST be of size MAX_PACKET_SIZE 
 * @param placeholder a pointer to a size_t variable that keeps track of where the next empty space is to save a byte 
 * @param byteRecieved a uint8_t holding the byte recieved from UART 
 * @param escaped a pointer to a uint8_t keeping track of whether the next byte should be escaped or not 
 * @return 0 on normal byte recieved, 1 on flag byte recieved, and other on error (see error code map in RecieveData.h for more details) 
 */
int readStuffed(uint8_t buffer[MAX_PACKET_SIZE], size_t* placeholder, uint8_t byteRecieved, uint8_t* escaped)
{
    if(*placeholder >= MAX_PACKET_SIZE)
    {
        return NO_STORAGE; //no more space inside buffer
    }
    if(byteRecieved == FLAG_BYTE)
    {
        buffer[*placeholder] = byteRecieved;
        *placeholder += 1;
        return 1; //lets the caller know a flag byte has been recieved
    }
    else if(*placeholder == 0 || *placeholder == 1)
    {
        return DATA_CORRUPTION; //if the first two bytes are not flags, somethings gone wrong
    }
    else if(byteRecieved == ESC_BYTE) //if recieved an escape byte, don't store in buffer, but set escaped to true
    {
        *escaped = 1;
    }
    else if(*escaped == 1) //perform escaped procedure on escaped bytes
    {
        buffer[*placeholder] = byteRecieved ^ XOR_BYTE;
        *escaped = 0; //reset escape var
        *placeholder += 1;
    }
    else
    {
        buffer[*placeholder] = byteRecieved; //byte recieved is normal, just put it in the buffer
        *placeholder += 1;
    }

    return 0;
}

/**
 * @brief Goes through packet given and makes sure that that headers, footers, and checksums are correct.
 * 
 * @param buffer where the packet to be parsed is stored 
 * @return 0 on sucess and DATA_CORRUPTION on fail 
 */
int parsePacket(uint8_t* buffer)
{
    //variable defs
    Header* header = (Header*) buffer;
    Footer* footer = (Footer*) (buffer + PREAMBLE_SIZE + header->length);
    uint8_t c1;
    uint8_t c2;

    //header and footer checks
    if(header->header != 0x7e7e)
    {
        return DATA_CORRUPTION;
    }
    if(footer->footer != 0x7e7e)
    {
        return DATA_CORRUPTION;
    }
    
    //validating checksums
    calculateFletchersChecksum(buffer, header->length, &c1, &c2);

    if(footer->checksum1 != c1)
    {
        return DATA_CORRUPTION;
    }
    if(footer->checksum2 != c2)
    {
        return DATA_CORRUPTION;
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
int calculateFletchersChecksum(uint8_t* buffer, int dataLen, uint8_t* check1, uint8_t* check2)
{
    //variable defs
    int packetLength = dataLen + PREAMBLE_SIZE;
    int c1 = 0;
    int c2 = 0;
    int i;

    //calculating the checksums
    for(i = 0; i < packetLength; i++)
    {
        c1 += buffer[i];
        c2 += c1;
    }
    c1 %= UINT8_MAX;
    c2 %= UINT8_MAX;

    //storing there values in the pointers given
    *check1 = (uint8_t) c1;
    *check2 = (uint8_t) c2;
    return 0;
}

/**
 * @brief Stuffs bytes from the given packet and sends them over UART
 * 
 * @param buffer the packet to send 
 * @param size size of the packet 
 * @param USARTx a pointer to a properply initialized USART_TypeDef 
 * @return 0 on sucess, FAILED_TO_SEND on failure 
 */
int sendPacket(uint8_t * buffer, uint32_t size, USART_TypeDef* USARTx)
{
    //variable defs
    int ret;
    uint8_t esc = ESC_BYTE;
    uint8_t toSend;
    int i;

    //loops through all data in packet
    for(i = 0; i < size; i++)
    {
        if(i > 1 && i < (size - 2) && (buffer[i] == ESC_BYTE || buffer[i] == FLAG_BYTE)) //if it's not the first or last two bytes in a packet 
        {                                                                                // and its a flag or escape byte, escape it
            ret = HAL_UART_Transmit(USARTx, &esc, 1, 100);
            if (ret != 0)
            {
                return FAILED_TO_SEND;
            }
            toSend = buffer[i] ^ XOR_BYTE;
            ret = HAL_UART_Transmit(USARTx, &toSend, 1, 100);
            if (ret != 0)
            {
               
                return FAILED_TO_SEND;
            }
        }
        else //send the normal byte
        {
            ret = HAL_UART_Transmit(USARTx, buffer + i, 1, 100);
            if (ret != 0)
            {
                return FAILED_TO_SEND;
            }
        }
    }
    
    return 0;
}

