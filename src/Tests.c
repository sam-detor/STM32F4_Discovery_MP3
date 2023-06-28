#include "PacketHandling.h"

#define HEADER 1
#define FOOTER 2
#define DATA 3
#define ALL 4

int testSend_sleep(uint8_t* buffer1,uint8_t* buffer2,uint8_t* buffer3,uint8_t* buffer4, USART_TypeDef* USARTx, size_t size);

/**
 * @brief Tests the senders ability to deal with the reciever sending a bad response packet
 * 
 * @param USARTx an initialized UART_TypeDef
 * @param thingToCorrupt decides which part(s) of the packet to corrupt  
 * @return return 0 on pass, > 0 on failure
 */
int corruptResponseTest(USART_TypeDef* USARTx, int thingToCorrupt)
{
    //variable defs
    CommsPacket corruptAck;
    uint8_t buffer[72];
    int ret;

    //setting up the corruptAck
    corruptAck.header = ackPacket.header;
    corruptAck.footer = ackPacket.footer;
    corruptAck.checksum1 = ackPacket.checksum1;
    corruptAck.checksum2 = ackPacket.checksum2;
    corruptAck.cmd = ackPacket.cmd;
    corruptAck.length = ackPacket.length;
    
    //corrupting the right
    switch (thingToCorrupt)
    {
        case HEADER:
            //corrupt the header
            corruptAck.header = 0x7f7e;
        break;

        case FOOTER:
            //corrupt the footer
            corruptAck.footer = 0x7f7e;
        break;

        case DATA:
            //corrupt the data
            corruptAck.length = 0x2;
        break; 

        case ALL:
            corruptAck.header = 0x7f7e; //corrupt all 3
            corruptAck.footer = 0x7f7e;
            corruptAck.length = 0x2;
        break;
    }
    

    //recieve the start packet
    ret = recievePacket(buffer, 200, USARTx); 
    if (ret == 0)
    {
        //send a good acknowlagement packet
        HAL_UART_Transmit(USARTx, (uint8_t*) &ackPacket, 8, 10000); 
    }
    else
    {
        //timeout
        return 1;
    }

    ret = recievePacket(buffer, 200, USARTx);  //recieve the first packet
    if (ret == 0)
    {
        HAL_UART_Transmit(USARTx, (uint8_t*) &corruptAck, 8, 10000); //sends bad packet
    }
    else
    {
        return 6;
    }
    
    
    ret = recievePacket(buffer, 2000, USARTx);  //recieve bad packet 
    if (ret == 0)
    {
        if (((CommsPacket *) buffer)->cmd != 2) //if the packet sent back isn't the "bad packet", fail
        {
            return 2;
        } 
        HAL_UART_Transmit(USARTx, (uint8_t*) &ackPacket, 8, 10000); //send the non corrupt one
    }
    else
    {
        return 5;
    }
    
    ret = recievePacket(buffer, 200, USARTx);  //recieve next packet
    if (ret == 0)
    {
        if (((CommsPacket *) buffer)->cmd != 0) //if the response packet isn't a data packet, fail 
        {
            return 3; 
        } 
        return 0; //passed the test
    }
    else
    {
        return 6;
    }

}

/**
 * @brief Tests the ability of the send and recieve methods to deal with escaped characters
 * 
 * @param USARTx UART_TypeDef for the correctly configured UART connection
 * @return return 0 on sucess and -1 on fail 
 */
int escapeTest(USART_TypeDef* USARTx)
{
    //variable defs
    char message[77] = "The maximum decimal number that can be represented with 1 byte is 255 or 1111";
    message[17] = 0x7e;
    message[19] = 0x7e;
    message[66] = 0x7d;
    message[70] = 0x7d;

    //send the message that requires the escaped chars
    send((uint8_t *) message,200,77, USARTx);
    return 0;
}

/**
 * @brief Tests the ability of the recieve method to detect and respond to a bad header, footer, and data in the data packets sent.
 * 
 * @param USARTx UART_TypeDef for the correctly configured UART connection
 * @return return 0 on sucess and -1 on fail  
 */
int dataCorruption(USART_TypeDef* USARTx, int thingToCorrupt)
{
    //Variable defs
    char message[140] = "The maximum decimal number that can be represented with 1 byte is 255 or 11111111. An 8-bit word greatly restricts the range of numbers that";
    uint8_t buffer1[72];
    uint8_t buffer2[72];
    uint8_t buffer3[72];
    uint8_t buffer4[72];
    size_t placeholder = 0;
    int i;
    int ret;

    //get the three packets that compose the message
    getPacketFromData((uint8_t *) message, &placeholder, buffer1,140);
    getPacketFromData((uint8_t *) message, &placeholder, buffer2,140);
    getPacketFromData((uint8_t *) message, &placeholder, buffer3,140);

    //save buffer 2 (the buffer that will be corrupted) in buffer 4
    for(i = 0; i < 72; i++)
    {
        buffer4[i] = buffer2[i];
    }

    switch (thingToCorrupt)
    {
        case HEADER:
        //corrupt header in middle packet
        buffer2[0] = 1;
        break;

        case FOOTER:
        //corrupt footer in middle packet
        buffer2[71] = 0;
        break;

        case DATA:
        //corrupt data in middle packet
        buffer2[33] = 0;
        buffer2[15] = 37;
        break;
    }
    
    //Send the corrupted message
    ret = testSend_sleep(buffer1, buffer2, buffer4,buffer3, USARTx, 140);
    return ret;

}
/**
 * @brief Sends a 3 packet message, buffer 2 is a corrupted version of buffer 3. Ensures that the reciever
 *        sends back the adequate responses for each packet sent, fails if not. Sleeps for a bit after sending
 *        the corrupt packet to make sure the reciever has time to detect the corruption and send the correct response.
 * 
 * @param buffer1 first packet (correctly formatted) of the message
 * @param buffer2 second packet (corrupted) of the message
 * @param buffer3 second packet (correctly formatted) of the message
 * @param buffer4 final packet (correctly formatted) of message 
 * @param USARTx UART_TypeDef for the correctly configured UART connection
 * @param size size of the message 
 * @return 0 on sucess and -1 on failure 
 */
int testSend_sleep(uint8_t* buffer1,uint8_t* buffer2,uint8_t* buffer3,uint8_t* buffer4, USART_TypeDef* USARTx, size_t size)
{
    //variable defs
    int ret;
    CommsPacket ackBuff;
    
    //send start packet
    ret = sendPacket((uint8_t*) &startPacket, OVERHEAD, USARTx);
    if (ret == 0)
    {
        //recieve ack
        ret = recievePacket((uint8_t*) &ackBuff, 800, USARTx); 
        if (ret != 0)
        {
            return 1; //timeout
        }
        else if (ackBuff.cmd != ACK_PACKET)
        {
            return 1;
        }
    }
    else
    {
        return FAILED_TO_SEND;
    }

    //send 1st packet
    ret = sendPacket((uint8_t*) buffer1, MAX_PACKET_SIZE, USARTx);
    if (ret == 0)
    {
        //recieve ack
        ret = recievePacket((uint8_t*) &ackBuff, 200, USARTx); 
        if (ret != 0)
        {
            return 2; //timeout
        }
        else if (ackBuff.cmd != ACK_PACKET)
        {
            return 2;
        }
    }
    else
    {
        return FAILED_TO_SEND;
    }

    //send 2nd corrupt packet
    ret = sendPacket((uint8_t*) buffer2, MAX_PACKET_SIZE, USARTx);
    if (ret == 0)
    {
        //recieve ack
        ret = recievePacket((uint8_t*) &ackBuff, 1000, USARTx); 
        if (ret != 0)
        {
            return 3; //timeout
        }
        else if (ackBuff.cmd != BAD_PACKET)
        {
            return 4;
        }
    }
    else
    {
        return FAILED_TO_SEND;
    }

    //resend uncorrupted version
    ret = sendPacket((uint8_t*) buffer3, MAX_PACKET_SIZE, USARTx);
    if (ret == 0)
    {
        //recieve ack
        ret = recievePacket((uint8_t*) &ackBuff, 800, USARTx); 
        if (ret != 0)
        {
            return 4; //timeout
        }
        else if (ackBuff.cmd != ACK_PACKET)
        {
            return 5;
        }
    }
    else
    {
        return FAILED_TO_SEND;
    }

    //Send last packet
    ret = sendPacket((uint8_t*) buffer4, size - 64 - 64 + 8, USARTx);
    if (ret == 0)
    {
        //recieve ack
        ret = recievePacket((uint8_t*) &ackBuff, 200, USARTx); 
        if (ret != 0)
        {
            return 5; //timeout
        }
        else if (ackBuff.cmd != ACK_PACKET)
        {
            return 5;
        }
    }
    else
    {
        return FAILED_TO_SEND;
    }


    //send end packet
    ret = sendPacket((uint8_t*) &endPacket, OVERHEAD, USARTx); 
    return 0;
}

/**
 * @brief Tests the ability of the sender and reciever to transmit many small messages. Sends a 140 byte message to
 *        the reciever 100 times and ensures the raw message sent back matches the original message sent.
 * 
 * @param USARTx UART_TypeDef for the correctly configured UART connection
 * @return 0 on sucess, -1 on fail 
 */
int manySmallMessages(USART_TypeDef* USARTx)
{
    //variable defs
    char message[140] = "The maximum decimal number that can be represented with 1 byte is 255 or 11111111. An 8-bit word greatly restricts the range of numbers that";
    int passed = 0;
    int ret;
    int i;
    int j;
    
    //Send the message 100 times
    for(i = 0; i < 10; i++)
    {
        ret = send((uint8_t*) message,400,140,USARTx); //send the message
        if (ret < 0)
        {
            passed = -1;
            break;
        }
        for(j = 0; j < 1000; j++);
    }
    return passed;
}
/**
 * @brief This method tests the ability of the sender and reciever to transmit one large message.
 *        A 1KB message is sent to the reciever, and then sent back to the sender in its raw form, 
 *        where the recieved message is compared to the sent one to ensure accuracy
 * 
 * @param USARTx UART_TypeDef for the correctly configured UART connection
 * @return 0 on sucess 1 on failure 
 */
int oneLargeMessage(USART_TypeDef* USARTx)
{
    //variable defs
    char message[1000] = "The byte is a unit of digital information that most commonly consists of eight bits. Historically, the byte was the number of bits used to encode a single character of text in a computer[1][2] and for this reason it is the smallest addressable unit of memory in many computer architectures. To disambiguate arbitrarily sized bytes from the common 8-bit definition, network protocol documents such as the Internet Protocol (RFC 791) refer to an 8-bit byte as an octet.[3] Those bits in an octet are usually counted with numbering from 0 to 7 or 7 to 0 depending on the bit endianness. The first bit is number 0, making the eighth bit number 7. The size of the byte has historically been hardware-dependent and no definitive standards existed that mandated the size. Sizes from 1 to 48 bits have been used.[4][5][6][7] The six-bit character code was an often-used implementation in early encoding systems, and computers using six-bit and nine-bit bytes were common in the 1960s. These systems often had";
    int passed = 0;
    int ret;


    ret = send((uint8_t*) message,400,1000,USARTx);
    passed = ret;
    return passed;
    
}