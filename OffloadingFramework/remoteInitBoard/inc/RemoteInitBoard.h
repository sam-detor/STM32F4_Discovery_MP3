/**
 * @file RemoteInitBoard.h
 * @author Sam Detor (sam.detor@yale.edu)
 * @brief This file holds all the relevant constants and function definitions for the user facing methods in the lib
 * @version 0.1
 * @date 2023-08-04
 * 
 * @copyright Copyright (c) 2023
 * 
 */
//Includes
#include <stdint.h>
#include <stdlib.h>
#include "stm32f4xx_usart.h"
#include "../../RemoteInit.h"

//Error Codes: These are the error codes used for all functions in this codebase
#define TIMEOUT -1
#define DATA_CORRUPTION -2
#define NO_STORAGE -3 //a buffer is not big enough to store the data being recieved/sent 
#define FAILED_TO_SEND -4
#define MANY_FAILS -5 //Failed to send too many times
#define UNKNOWN_ERROR -6
#define FAILED_TO_READ -7
#define BAD_PARAM -8 //The function was handed a bad value
#define BUSY -9 //The send/recieve functions are already being used

//Global variables
extern volatile uint32_t* tick_ms;
extern char _ebss;

//Function definitions
int recieve(uint8_t * data, size_t size, size_t timeout_ms, USART_TypeDef* USARTx, size_t* bytesRecieved);
int sendStartPacket(USART_TypeDef* USARTx);