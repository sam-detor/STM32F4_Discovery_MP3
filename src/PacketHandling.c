#include "PacketHandling.h"

//Global Vars
CommsPacket ackPacket = {header: 0x7e7e, cmd: ACK_PACKET, length: 0, checksum1: 253, checksum2: 119, footer: 0x7e7e};
CommsPacket badPacket = {header: 0x7e7e, cmd: BAD_PACKET, length: 0, checksum1: 254, checksum2: 121, footer: 0x7e7e};
CommsPacket endPacket = {header: 0x7e7e, cmd: END_PACKET, length: 0, checksum1: 0, checksum2: 123, footer: 0x7e7e};
CommsPacket startPacket = {header: 0x7e7e, cmd: START_PACKET, length: 0, checksum1: 1, checksum2: 125, footer: 0x7e7e};


/**
 * @brief Takes a byte read from UART and un-stuffs it and stores the data in its unstuffed form in "buffer".
 * 
 * @param buffer a buffer to store the recieved unstuffed bytes in, MUST be of size MAX_PACKET_SIZE 
 * @param placeholder a pointer to a size_t variable that keeps track of where the next empty space is to save a byte 
 * @param byteRecieved a uint8_t holding the byte recieved from UART 
 * @param escaped a pointer to a uint8_t keeping track of whether the next byte should be escaped or not 
 * @return 0 on normal byte recieved, 1 on flag byte recieved, and other on error (see error code map for more details) 
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
        return 1;
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
        *escaped = 0;
        *placeholder += 1;
    }
    else
    {
        buffer[*placeholder] = byteRecieved;
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
 * @brief Calculating the Fletchers checksum for the given packet
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
 * @param USARTx a properply initialized USART_TypeDef 
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

