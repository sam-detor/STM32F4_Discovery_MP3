#include <fcntl.h>
#include <stdio.h>
#include <unistd.h>
#include <stdint.h>
#include <termios.h>
#include <stdlib.h>
#include <string.h>
#include <sys/time.h>
#include "../../RemoteInit.h"

//Error Codes
#define TIMEOUT -1
#define DATA_CORRUPTION -2
#define NO_STORAGE -3 //a buffer is not big enough to store the data being recieved/sent 
#define FAILED_TO_SEND -4
#define MANY_FAILS -5 //failed to send too many times
#define UNKNOWN_ERROR -6
#define FAILED_TO_READ -7

//Packet info
#define MAX_PACKET_SIZE 72

//Function defs
//From SendData.c
int send(uint8_t *data, size_t timeout_ms, size_t size, int fd);
int printCommsPacket(int packet);

//From PortMethods.c
int commsInit(const char* device, uint32_t baudRate);
ssize_t read_port(int fd, uint8_t * buffer, size_t size);
int write_port(int fd, uint8_t * buffer, size_t size);

//From RecieveData.c
int recieve(uint8_t * data, size_t size, size_t timeout_ms, int fd);
int recievePing(uint8_t buffer[MAX_PACKET_SIZE], size_t timeout_ms, int fd);



