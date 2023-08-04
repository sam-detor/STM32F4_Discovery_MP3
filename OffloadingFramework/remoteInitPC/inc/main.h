/**
 * @file RemoteInitBoard.h
 * @author Sam Detor (sam.detor@yale.edu)
 * @brief This file holds all the relevant constants and function definitions for main.c
 * @version 0.1
 * @date 2023-08-04
 * 
 * @copyright Copyright (c) 2023
 * 
 */

//Includes
#include <fcntl.h>
#include <stdio.h>
#include <unistd.h>
#include <stdint.h>
#include <termios.h>
#include <stdlib.h>
#include <string.h>
#include <sys/time.h>
#include "../../RemoteInit.h"

//Error Codes: These are the error codes used for all functions in this codebase
#define TIMEOUT -1
#define DATA_CORRUPTION -2
#define NO_STORAGE -3 //a buffer is not big enough to store the data being recieved/sent 
#define FAILED_TO_SEND -4
#define MANY_FAILS -5 //Failed to send too many times
#define UNKNOWN_ERROR -6
#define FAILED_TO_READ -7

//Packet info
#define MAX_PACKET_SIZE 262

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
int receivePing(uint8_t buffer[MAX_PACKET_SIZE], size_t timeout_ms, int fd);

//From PacketHandling.c
double getTimeDiff_ms(struct timeval start, struct timeval end);


