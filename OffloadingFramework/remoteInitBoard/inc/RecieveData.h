/**
 * @file RecieveData.h
 * @author Sam Detor (sam.detor@yale.edu)
 * @brief This file outlines the data structures, constants and function definitions 
 *        needed to communicate with the bluetooth module/PC over UART using the packet 
 *        structure detailed below.
 * @version 0.1
 * @date 2023-08-04
 * 
 * @copyright Copyright (c) 2023
 * 
 * ******************************************************************************************************
 *                                            PACKET STRUCTURE
 * 
 *       ____________Header___________                _____________Footer______________
 *      |_____________________________|______________|_________________________________|
 *      | Preamble | Command | Length | Data payload | Fletcher's Checksum | Postamble |
 *       ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
 *        2 bytes    1 byte    1 byte  0 - 254b bytes        2 bytes          2 bytes
 * 
 *      Min packet size: 8 bytes (Comunication packet)
 *      Max packet size: 262 bytes
 * 
 *      Preamble: The preamble for every packet is always 0x7e7e. To ensure that this 
 *                byte never appears in the rest of the packet (except the postamble), 
 *                byte stuffing in used. Please see the byte stuffing section for more 
 *                specifics. 
 *      
 *      Command: This byte is used to tell whether the packet is a communication packet or
 *               a data packet. 0 indicates a data packet, where all other values of Cmd 
 *               indicate a communication packet. Comunication packets have a data payload 
 *               of 0 and they are used by the sender and receiver to communicate. The 
 *               following communication packets are used in the codebase:
 *                  1 - Acknowlagement packet: This packet is sent by the receiver to the 
 *                                             sender after the sucessful sending of a packet. 
 *                                             This signals to the sender that it can send the 
 *                                             next packet
 *                  2 - Bad data packet: This packet can be sent by either the sender or receiver 
 *                                       to indicate that they have received bad/corrupted data 
 *                                       and need the data to be re-sent.
 *                  3 - End packet: This packet is sent by the sender to the receiver to indicate
 *                                  that all data has been sent.
 *                  4 - Start packet: This packet is sent by the receiver to the sender to request 
 *                                    data, and then sent back to the receiver by the sender to 
 *                                    indicate the start of a data transmission.
 *      Length: This bytes stores the length of the data payload. Can be 0 - 254, as 254 is the max
 *              data payload
 *      
 *      Fletcher's checksum: 2 one byte sums that help catch errors in byte order and byte contents
 *                           in the packet. Please look here for more information on the
 *                           calculation: https://en.wikipedia.org/wiki/Fletcher%27s_checksum
 *     
 *      Postamble: The postamble for every packet is always 0x7e7e. To ensure that this 
 *                byte never appears in the rest of the packet (except the preamble), 
 *                byte stuffing in used. Please see the byte stuffing section for more 
 *                specifics. 
 * 
 * 
 *     Byte stuffing: In order to make sure 0x7e never appears outside of the preamble and postamble
 *                    byte stuffing is used. The method used is very similar to the method of byte 
 *                    stuffing used in point-to-point protocol (PPP). The author consulted this
 *                    website during the development: 
 *                    https://eli.thegreenplace.net/2009/08/12/framing-in-serial-communications
 *                    The escape byte used is 0x7d. So when 0x7e appears outside the header/footer
 *                    or when 0x7d appears, 0x7d is first sent, and then the byte to be stuffed is
 *                    XOR'ed with 0x20 and then sent. When the receiver receives byte 0x7d, it knows
 *                    to XOR the following byte with 0x20 to get the original value.  
 * 
 * ******************************************************************************************************
 */  


#include "RemoteInitBoard.h"

//Constants 

//Byte Stuffing
#define FLAG_BYTE 0x7e //byte in the pre/postamble
#define ESC_BYTE 0x7d
#define XOR_BYTE 0x20

//Command codes
#define NO_CMD 0
#define ACK_PACKET 1
#define BAD_PACKET 2
#define END_PACKET 3
#define START_PACKET 4
#define ODD 5
#define EVEN 6

//Packet Constants
#define MAX_PACKET_SIZE 262
#define OVERHEAD 8
#define FRAME_DATA_FIELD_SIZE 254
#define PREAMBLE 0x7e7e
#define POSTAMBLE 0x7e7e
#define PREAMBLE_SIZE 4

//Typedefs

//Packet header
typedef struct header {
    uint16_t header;
    uint8_t cmd;
    uint8_t length;
} Header;

//Packet footer
typedef struct footer {
    uint8_t checksum1;
    uint8_t checksum2;
    uint16_t footer;   
} Footer;

//Comms Packet (a packet with a data payload of 0)
typedef struct commsPacket {
    uint16_t header;
    uint8_t cmd;
    uint8_t length;
    uint8_t checksum1;
    uint8_t checksum2;
    uint16_t footer;   
} CommsPacket;

//Receiver States
typedef enum receiveCase {
    RECIEVE, PROCESS_PACKET, RESPOND
} ReceiveCase;

//HAL replacement function defs
int HAL_UART_Transmit(USART_TypeDef* USARTx, const uint8_t *pData, uint16_t Size, uint32_t Timeout);
int HAL_UART_Receive(USART_TypeDef* USARTx, uint8_t *pData, uint16_t Size, uint32_t Timeout);
int calculateFletchersChecksum(uint8_t* buffer, int dataLen, uint8_t* check1, uint8_t* check2);