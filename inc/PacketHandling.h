#include "DataTransmission.h"

//global vars
extern CommsPacket ackPacket;
extern CommsPacket badPacket;
extern CommsPacket endPacket;
extern CommsPacket startPacket;

//function defs
int readStuffed(uint8_t buffer[MAX_PACKET_SIZE], size_t* placeholder, uint8_t byteRecieved, uint8_t* escaped);
int parsePacket(uint8_t* buffer);
int calculateFletchersChecksum(uint8_t* buffer, int dataLen, uint8_t* check1, uint8_t* check2);
int sendPacket(uint8_t * buffer, uint32_t size, USART_TypeDef* USARTx);
int getPacketFromData(uint8_t *data, size_t* placeholder, uint8_t buffer[MAX_PACKET_SIZE], size_t size);


