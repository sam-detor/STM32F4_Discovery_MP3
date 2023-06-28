#include "main.h"

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
#define MAX_PACKET_SIZE 72
#define OVERHEAD 8
#define FRAME_DATA_FIELD_SIZE 64
#define PREAMBLE 0x7e7e
#define POSTAMBLE 0x7e7e
#define PREAMBLE_SIZE 4

//Port Constants
#define BAUD_RATE 115200

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

//Function defs
int recievePacket(uint8_t buffer[MAX_PACKET_SIZE], size_t timeout_ms, USART_TypeDef* USARTx);

//externs
extern CommsPacket ackPacket;




