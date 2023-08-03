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
#define MAX_PACKET_SIZE 262//72
#define OVERHEAD 8
#define FRAME_DATA_FIELD_SIZE 254
#define PREAMBLE 0x7e7e
#define POSTAMBLE 0x7e7e
#define PREAMBLE_SIZE 4

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

typedef enum receiveCase {
    RECIEVE, PROCESS_PACKET, RESPOND
} ReceiveCase;

//HAL replacement function defs
int HAL_UART_Transmit(USART_TypeDef* USARTx, const uint8_t *pData, uint16_t Size, uint32_t Timeout);
int HAL_UART_Receive(USART_TypeDef* USARTx, uint8_t *pData, uint16_t Size, uint32_t Timeout);