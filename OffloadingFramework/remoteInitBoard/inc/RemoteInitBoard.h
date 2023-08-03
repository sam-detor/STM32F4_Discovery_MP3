#include <stdint.h>
#include <stdlib.h>
#include "stm32f4xx_usart.h"
#include "../../RemoteInit.h"

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
#define PRE_PACKET_DATA_CORRUPTION -10

//global vars
extern volatile uint32_t* tick_ms;
extern char _ebss;

//function defs
int recieve(uint8_t * data, size_t size, size_t timeout_ms, USART_TypeDef* USARTx, size_t* bytesRecieved);
int sendStartPacket(USART_TypeDef* USARTx);