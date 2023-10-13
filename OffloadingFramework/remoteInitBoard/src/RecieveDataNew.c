#include "RecieveData.h"

// Comms packets
static CommsPacket ackPacket = {header: 0x7e7e, cmd: ACK_PACKET, length: 0, checksum1: 253, checksum2: 119, footer: 0x7e7e};
static CommsPacket badPacket = {header: 0x7e7e, cmd: BAD_PACKET, length: 0, checksum1: 254, checksum2: 121, footer: 0x7e7e};
// static CommsPacket endPacket = {header: 0x7e7e, cmd: END_PACKET, length: 0, checksum1: 0, checksum2: 123, footer: 0x7e7e};
static CommsPacket startPacket = {header: 0x7e7e, cmd: START_PACKET, length: 0, checksum1: 1, checksum2: 125, footer: 0x7e7e};

/**
 * @brief Stuffs bytes from the given packet and sends them over UART
 * 
 * @param buffer the packet to send 
 * @param size size of the packet 
 * @param USARTx a pointer to a properply initialized USART_TypeDef 
 * @return 0 on sucess, FAILED_TO_SEND on failure 
 */
static int sendLinkPacket(uint8_t *buffer, uint32_t size, USART_TypeDef* USARTx)
{
    if (size < 4)
        return FAILED_TO_SEND;
    
    uint8_t *ptr = buffer;
    uint8_t *end = buffer + size - 2;

    // Send the first two bytes, the preamble.
    if (HAL_UART_Transmit(USARTx, ptr++, 1, 100))
        return FAILED_TO_SEND;
    if (HAL_UART_Transmit(USARTx, ptr++, 1, 100))
        return FAILED_TO_SEND;
    
    // For the following bytes, escape them if necessary and then send.
    uint8_t esc = ESC_BYTE;
    while (ptr < end)
    {
        uint8_t byte = *ptr++;
        if (byte == ESC_BYTE || byte == FLAG_BYTE) {
            byte ^= XOR_BYTE;
            if (HAL_UART_Transmit(USARTx, &esc, 1, 100))
                return FAILED_TO_SEND;
        }
        if (HAL_UART_Transmit(USARTx, &byte, 1, 100))
            return FAILED_TO_SEND;
    }

    // Finally send two bytes for the postamble.
    if (HAL_UART_Transmit(USARTx, ptr++, 1, 100))
        return FAILED_TO_SEND;
    if (HAL_UART_Transmit(USARTx, ptr++, 1, 100))
        return FAILED_TO_SEND;
    
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

static int validatePacket(uint8_t *buffer)
{
    // Variable defs
    Header* header = (Header*) buffer;
    Footer* footer = (Footer*) (buffer + PREAMBLE_SIZE + header->length);
    uint8_t c1;
    uint8_t c2;

    // Header and footer checks
    if (header->header != 0x7e7e || footer->footer != 0x7e7e)
        return DATA_CORRUPTION;
    
    // Validating checksums
    calculateFletchersChecksumNew(buffer, header->length, &c1, &c2);

    if(footer->checksum1 != c1 || footer->checksum2 != c2)
        return DATA_CORRUPTION;

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
static int recieveLinkPacket(uint8_t buffer[MAX_PACKET_SIZE], size_t timeout_ms, USART_TypeDef* USARTx)
{
    uint8_t byte;
    int numFlagBytes = 0;
    int idx = 0;

    // Loop until we see two consecutive flag bytes.
    while (numFlagBytes < 2)
    {
        if (HAL_UART_Receive(USARTx, &byte, 1, timeout_ms))
            return TIMEOUT;
        if (byte == FLAG_BYTE)
            ++numFlagBytes;
        else
            numFlagBytes = 0;
    }

    while (numFlagBytes < 4)
    {
        // Prevent buffer overflow.
        if (idx >= MAX_PACKET_SIZE)
            return NO_STORAGE;
        
        // Receive a byte.
        if (HAL_UART_Receive(USARTx, &byte, 1, timeout_ms))
            break;

        // If the byte is the escape byte, proceed to read the next byte.
        if (byte == ESC_BYTE)
        {
            if (HAL_UART_Receive(USARTx, &byte, 1, timeout_ms))
                break;
            byte ^= XOR_BYTE;
        }
        // If the byte is the flag byte, increment the counter.
        else
        {
            if (byte == FLAG_BYTE)
                ++numFlagBytes;
        }

        // Store the received byte.
        buffer[idx++] = byte;
    }

    // If we didn't finish reading a whole packet, report data corruption.
    if (numFlagBytes < 4)
        return DATA_CORRUPTION;

    return 0;
}

/**
 * @brief Copy the data in a packet to a given buffer. It does *not* ensure the
 *        length of the destination buffer is enough to hold the packet data.
 *        It is the caller's responsibility to avoid buffer overflow.
 * 
 * @param dst destination pointer
 * @param packet pointer to a packet whose data is to be copied out
 */
#pragma GCC push_options
#pragma GCC optimize ("no-peel-loops")
static void __attribute__((noinline)) copyOutDataUnchecked(uint8_t *dst, uint8_t *packet)
{
    Header *pHeader = (Header *) packet;
    uint8_t *ptr = packet + PREAMBLE_SIZE;
    uint8_t *end = ptr + pHeader->length;

    while (ptr < end)
        *dst++ = *ptr++;
}
#pragma GCC pop_options

enum ReceiveStates {
    WAIT_START,
    EXPECT_ODD,
    EXPECT_EVEN,
};

/**
 * @brief User facing method to recieve data sent over UART with the "send" method using packet structures and sending protocols defined in 
 *        RecieveData.c and SendData.c. Assumes a correctly initialized Hal UART system, will not do any checks to ensure this
 * @param data the data buf to store the recieved data in 
 * @param size the size of the data buf
 * @param timeout_ms how long to wait for data before failing 
 * @param USARTx a pointer to a correctly initialized UART_TypeDef  
 * @return 0 on pass and other on fail (see error code map in RecieveData.h for specific details)
 */
int recieve(uint8_t *data, size_t size, size_t timeout_ms, USART_TypeDef* USARTx, size_t* pNumBytesRecieved)
{
    uint8_t buffer[MAX_PACKET_SIZE];
    int ret;
    Header *pHeader;
    int state = WAIT_START;
    size_t numBytesReceived = 0;

    for (;;)
    {
        // Get the next packet.
        ret = recieveLinkPacket(buffer, timeout_ms, USARTx);

        // Return if timeout.
        if (ret == TIMEOUT)
            return ret;
        
        // If data is corrupted, send back NACK and wait for the next packet.
        if (ret == DATA_CORRUPTION || validatePacket(buffer) != 0)
        {
            ret = sendLinkPacket((uint8_t *) &badPacket, OVERHEAD, USARTx);
            if (ret < 0)
                return ret;
            continue;
        }

        // Check if we are going to overflow the destination data buffer.
        // Command packets have length 0 so the calculation below will work fine.
        pHeader = (Header *) buffer;
        if (size - numBytesReceived < pHeader->length)
            return NO_STORAGE;

        switch (pHeader->cmd)
        {
            // If we are waiting for the start packet, now we have received it.
            // We now expect to receive even data packet. If we are not waiting
            // for the start packet, the packet is duplicated transmission, so
            // we will simply send back an ACK.
            case START_PACKET:
                if (state == WAIT_START)
                    state = EXPECT_EVEN;
                break;

            // If we receive an odd data packet and we are expecting it, copy
            // out the data and increase the received byte number. Otherwise,
            // the packet is duplicated transmission, so we ignore it and simply
            // send back an ACK.
            case ODD:
                if (state == EXPECT_ODD)
                {
                    copyOutDataUnchecked(data + numBytesReceived, buffer);
                    state = EXPECT_EVEN;
                    numBytesReceived += pHeader->length;
                }
                break;

            // Just a mirror to the `ODD` case.
            case EVEN:
                if (state == EXPECT_EVEN)
                {
                    copyOutDataUnchecked(data + numBytesReceived, buffer);
                    state = EXPECT_ODD;
                    numBytesReceived += pHeader->length;
                }
                break;

            // This is the end of the connection. We send back a final ACK,
            // update the received byte number to the caller, and return.
            case END_PACKET:
                ret = sendLinkPacket((uint8_t *) &ackPacket, OVERHEAD, USARTx);
                if (ret < 0)
                    return ret;
                *pNumBytesRecieved = numBytesReceived;
                return 0;

            // The receiver is not expected to see these packet types. We
            // ignore them and send back an ACK.
            case NO_CMD:
            case ACK_PACKET:
                break;

            default:
                return UNKNOWN_ERROR;
        }

        // We always send back an ACK for valid-formed packet.
        ret = sendLinkPacket((uint8_t *) &ackPacket, OVERHEAD, USARTx);
        if (ret < 0)
            return ret;
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
    return sendLinkPacket((uint8_t *) &startPacket, sizeof(startPacket), USARTx);
}
