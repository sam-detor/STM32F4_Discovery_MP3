#include "PacketHandling.h"

//Comms packets
CommsPacket ackPacket;
CommsPacket badPacket;
CommsPacket endPacket;
CommsPacket startPacket;

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

    //calculating checksum
    for(int i = 0; i < packetLength; i++)
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
 * @param fd file descriptor for the open/correctly configured port
 * @return 0 on sucess, FAILED_TO_SEND on failure 
 */
int sendPacket(uint8_t* buffer, int size, int fd) 
{
    //variable defs
    int ret;
    uint8_t esc = ESC_BYTE;
    uint8_t toSend;

    //loops through all the data in the packet
    for(int i = 0; i < size; i++)
    {
        if(i > 1 && i < (size - 2) && (buffer[i] == ESC_BYTE || buffer[i] == FLAG_BYTE)) //if it's not the first or last two bytes in a packet 
        {                                                                                // and its a flag or escape byte, escape it
            ret = write_port(fd, &esc, 1);
            if (ret < 0)
            {
                fprintf(stderr, "Failed to write to port\n");
                return FAILED_TO_SEND;
            }
            toSend = buffer[i] ^ XOR_BYTE;
            ret = write_port(fd, &toSend, 1);
            if (ret < 0)
            {
                fprintf(stderr, "Failed to write to port\n");
                return FAILED_TO_SEND;
            }
        }
        else //send the normal byte
        {
            ret = write_port(fd, buffer + i, 1);
            if (ret < 0)
            {
                fprintf(stderr, "Failed to write to port\n");
                return FAILED_TO_SEND;
            }
        }
    }
    return 0;
}

/**
 * @brief Takes a byte read from UART and un-stuffs it and stores the data in its unstuffed form in "buffer".
 * 
 * @param buffer a buffer to store the recieved unstuffed bytes in
 * @param size size of "buffer"
 * @param placeholder a pointer to a size_t variable that keeps track of where the next empty space is to save a byte 
 * @param byteRecieved a uint8_t holding the byte recieved from UART 
 * @param escaped a pointer to a uint8_t keeping track of whether the next byte should be escaped or not 
 * @return 0 on normal byte recieved, 1 on flag byte recieved, and other on error (see error code map for more details) 
 */
int readStuffed(uint8_t *buffer, size_t size, size_t* placeholder, uint8_t byteRecieved, uint8_t* escaped)
{
    if(*placeholder >= size)
    {
        fprintf(stderr, "No more room in given array for bytes\n");
        return NO_STORAGE;
    }
    if(byteRecieved == FLAG_BYTE)
    {
        buffer[*placeholder] = byteRecieved;
        *placeholder += 1;
        return 1;
    }
    else if(*placeholder == 0 || *placeholder == 1) //if the first two bytes aren't flags
    {
        fprintf(stderr, "Failed with invalid packet: Started reading in the middle of a packet\n");
        return DATA_CORRUPTION;
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
int parseMessage(uint8_t* buffer)
{
    //variable defs
    Header* header = (Header*) buffer;
    Footer* footer = (Footer*) (buffer + PREAMBLE_SIZE + header->length);
    uint8_t c1;
    uint8_t c2;

    //header and footer checks
    if(header->header != 0x7e7e)
    {
        fprintf(stderr, "Failed: Header is wrong\n");
        return DATA_CORRUPTION;
    }
    if(footer->footer != 0x7e7e)
    {
        fprintf(stderr, "Failed: Incomplete packet, footer is wrong\n");
        return DATA_CORRUPTION;
    }
    
    //validating checksums
    calculateFletchersChecksum(buffer, header->length, &c1, &c2);

    if(footer->checksum1 != c1)
    {
        fprintf(stderr, "Failed due to data corruption: c1 invalid\n");
        return DATA_CORRUPTION;
    }
    if(footer->checksum2 != c2)
    {
        fprintf(stderr, "Failed due to data corruption: c2 invalid\n");
        return DATA_CORRUPTION;
    }

    return 0;
}


/**
 * @brief This method sends a CommsPacket based on the value of "commsType"
 * 
 * @param commsType integer that dictates what Comms packet will be sent, see DataTransmission.h for more details
 * @param fd file descriptor for the open/correctly configured port 
 * @return 0 on sucess and other on error (see error codes for more details)
 */
int sendCommsPacket(int commsType, int fd)
{
    //variable defs
    int ret;

    //sending the CommsPacket based on commsType
    switch (commsType)
    {
        case ACK_PACKET:
            ret = sendPacket((uint8_t*) &ackPacket, OVERHEAD, fd);
        break;

        case BAD_PACKET:
            ret = sendPacket((uint8_t*) &badPacket, OVERHEAD, fd);
        break;

        case END_PACKET:
            ret = sendPacket((uint8_t*) &endPacket, OVERHEAD, fd);
        break;

        case START_PACKET:
            ret = sendPacket((uint8_t*) &startPacket, OVERHEAD, fd);
        break;

        default:
            ret = UNKNOWN_ERROR;
            printf("Weird stuff happening\n");
        break;
    }

    //if it fails to send
    if (ret < 0)
    {
        fprintf(stderr, "Failed to send Comms Packet %d\n", commsType);\
        return ret;
    }
    return 0; 
}

/**
 * @brief Initializes all the comms packet 
 * 
 * @return int -- always 0
 */
int commsPacketInit(void)
{
    //acknowlage packet init
    ackPacket.header = PREAMBLE;
    ackPacket.cmd = ACK_PACKET;
    ackPacket.length = 0;
    calculateFletchersChecksum((uint8_t*) &ackPacket, 0, &(ackPacket.checksum1), &(ackPacket.checksum2));
    ackPacket.footer = POSTAMBLE;
    
    //bad packet init
    badPacket.header = PREAMBLE;
    badPacket.cmd = BAD_PACKET;
    badPacket.length = 0;
    calculateFletchersChecksum((uint8_t*) &badPacket, 0, &(badPacket.checksum1), &(badPacket.checksum2));
    badPacket.footer = POSTAMBLE;

    //end packet init
    endPacket.header = PREAMBLE;
    endPacket.cmd = END_PACKET;
    endPacket.length = 0;
    calculateFletchersChecksum((uint8_t*) &endPacket, 0, &(endPacket.checksum1), &(endPacket.checksum2));
    endPacket.footer = POSTAMBLE;

    //start packet init
    startPacket.header = PREAMBLE;
    startPacket.cmd = START_PACKET;
    startPacket.length = 0;
    calculateFletchersChecksum((uint8_t*) &startPacket, 0, &(startPacket.checksum1), &(startPacket.checksum2));
    startPacket.footer = POSTAMBLE;
    
    return 0;
}

/**
 * @brief Prints a comms packet
 * 
 * @param packet the int that determines what packet to print, see #defines for more spesifics  
 * @return int, always 0 
 */
int printCommsPacket(int packet)
{
    //variable defs
    CommsPacket myPacket;

    //choosing which packet to print
    switch (packet)
    {
        case ACK_PACKET:
        myPacket = ackPacket;
        break;

        case BAD_PACKET:
        myPacket = badPacket;
        break;

        case END_PACKET:
        myPacket = endPacket;
        break;

        case START_PACKET:
        myPacket = startPacket;
        break;

        default:
        printf("Weirdness\n");
        return -1;
    }

    //Print packet
    printf("%d Packet\n", packet);
    printf("Header\n");
    printf("Preamble: 0x%x\n", myPacket.header);
    printf("Cmd: 0x%x\n", myPacket.cmd);
    printf("Length: %d\n", myPacket.length);
    printf("Footer:\n");
    printf("checksum1: %d\n", myPacket.checksum1);
    printf("checksum2: %d\n", myPacket.checksum2);
    printf("footer: 0x%x\n", myPacket.footer);
    printf("\n");
    return 0;
}

/**
 * @brief Returns the time difference between the times recorded in the start and end timeval structs
 * 
 * @param start a struct timeval filled in with the start of the time window that needs to be measured using the gettimeofDay method 
 * @param end a struct timeval filled in with the end of the time window that needs to be measured using the gettimeofDay method  
 * @return double -- the time difference in ms
 */
double getTimeDiff_ms(struct timeval start, struct timeval end)
{
    //variable defs
    long seconds, microseconds;

    //get the difference in seconds and in microseconds between the two times
    seconds = end.tv_sec - start.tv_sec;
    microseconds = end.tv_usec - start.tv_usec;

    //converting the two differences together and 
    return (seconds * 1e3) + (microseconds * 1e-3);

}
