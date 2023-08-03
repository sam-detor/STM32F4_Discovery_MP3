#include "DataTransmission.h"

//Stuffed Byte Constants
#define ESC_BYTE 0x7d
#define FLAG_BYTE 0x7e
#define XOR_BYTE 0x20

//global vars
extern CommsPacket ackPacket;
extern CommsPacket badPacket;
extern CommsPacket endPacket;
extern CommsPacket startPacket;

//Function defs
int calculateFletchersChecksum(uint8_t* buffer, int dataLen, uint8_t* check1, uint8_t* check2);
int readStuffed(uint8_t *buffer, size_t size, size_t* placeholder, uint8_t byteRecieved, uint8_t* escaped);
int parseMessage(uint8_t* buffer);
//double getTimeDiff_ms(struct timeval start, struct timeval end);
int recievePacket(uint8_t buffer[MAX_PACKET_SIZE], size_t timeout_ms, int fd);
