#include <stdint.h>
#include <stdlib.h>
#include "stm32f4xx_usart.h"
#include "../../RemoteInit.h"



//global vars
extern volatile uint32_t* tick_ms;
extern char _ebss;

//function defs
int recieve(uint8_t * data, size_t size, size_t timeout_ms, USART_TypeDef* USARTx, size_t* bytesRecieved);
int sendStartPacket(USART_TypeDef* USARTx);