#include "RemoteInitBoard.h"
//Stuffed Byte Constants
#define FLAG_BYTE 0x7e
#define ESC_BYTE 0x7d
#define XOR_BYTE 0x20

//Commands
#define NO_CMD 0
#define ACK_PACKET 1
#define BAD_PACKET 2
#define END_PACKET 3
#define START_PACKET 4

//Packet Constants
#define MAX_PACKET_SIZE 248//72
#define OVERHEAD 8
#define FRAME_DATA_FIELD_SIZE 240
#define PREAMBLE 0x7e7e
#define POSTAMBLE 0x7e7e
#define PREAMBLE_SIZE 4

//Port Constants

//Error Codes
#define TIMEOUT -1
#define DATA_CORRUPTION -2
#define NO_STORAGE -3 //a buffer is not big enough to store the data being recieved/sent 
#define FAILED_TO_SEND -4
#define MANY_FAILS -5 //failed to send too many times
#define UNKNOWN_ERROR -6
#define FAILED_TO_READ -7
#define BAD_PARAM -8
#define BUSY -9

//Typedefs
typedef struct header {
    uint16_t header;
    uint8_t cmd;
    uint8_t length;
} Header;

typedef struct footer {
    uint8_t checksum1;
    uint8_t checksum2;
    uint16_t footer;   
} Footer;

typedef struct commsPacket {
    uint16_t header;
    uint8_t cmd;
    uint8_t length;
    uint8_t checksum1;
    uint8_t checksum2;
    uint16_t footer;   
} CommsPacket;

//global vars
extern CommsPacket ackPacket;
extern CommsPacket badPacket;
extern CommsPacket endPacket;
extern CommsPacket startPacket;

//PacketHandling.c function defs
int readStuffed(uint8_t buffer[MAX_PACKET_SIZE], size_t* placeholder, uint8_t byteRecieved, uint8_t* escaped);
int parsePacket(uint8_t* buffer);
int calculateFletchersChecksum(uint8_t* buffer, int dataLen, uint8_t* check1, uint8_t* check2);
int sendPacket(uint8_t * buffer, uint32_t size, USART_TypeDef* USARTx);
int getPacketFromData(uint8_t *data, size_t* placeholder, uint8_t buffer[MAX_PACKET_SIZE], size_t size);
int recievePacket(uint8_t buffer[MAX_PACKET_SIZE], size_t timeout_ms, USART_TypeDef* USARTx);

//HAL replacement function defs
//int HAL_UART_Transmit(USART_TypeDef* USARTx, const uint8_t *pData, uint16_t Size, uint32_t Timeout);
//int HAL_UART_Receive(USART_TypeDef* USARTx, uint8_t *pData, uint16_t Size, uint32_t Timeout);