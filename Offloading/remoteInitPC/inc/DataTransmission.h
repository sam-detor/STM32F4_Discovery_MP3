#include "main.h"

//Packet Constants
#define OVERHEAD 8
#define FRAME_DATA_FIELD_SIZE 64
#define PREAMBLE 0x7e7e
#define POSTAMBLE 0x7e7e
#define PREAMBLE_SIZE 4

//Comms packet codes
#define NO_CMD 0
#define ACK_PACKET 1
#define BAD_PACKET 2
#define END_PACKET 3
#define START_PACKET 4

//Packet structs 
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
//From SendData.c
int getPacketFromData(uint8_t *data, size_t* placeholder, uint8_t buffer[MAX_PACKET_SIZE], size_t size);

//From PacketHandling.c
int sendPacket(uint8_t* buffer, int size, int fd);
int sendCommsPacket(int commsType, int fd);
int commsPacketInit(void);

//From PortMethods.c
int open_serial_port(const char * device, uint32_t baud_rate);


