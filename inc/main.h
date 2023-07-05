/*
 * main.h
 *
 *  Created on: 10 jul 2012
 *      Author: BenjaminVe
 */
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <math.h>
#include "stm32f4xx_conf.h"

#ifndef MAIN_H_
#define MAIN_H_

// Function prototypes
void timing_handler();
uint32_t getTick();


//client facing transmission functions
int recieve(uint8_t * data, size_t size, size_t timeout_ms, USART_TypeDef* USARTx);
int corruptResponseTest(USART_TypeDef* USARTx, int thingToCorrupt);
int send(uint8_t *data, size_t timeout_ms, size_t size, USART_TypeDef* USARTx);
int escapeTest(USART_TypeDef* USARTx);
int dataCorruption(USART_TypeDef* USARTx, int thingToCorrupt);
int manySmallMessages(USART_TypeDef* USARTx);
int oneLargeMessage(USART_TypeDef* USARTx);
int HAL_UART_Transmit(USART_TypeDef* USARTx, const uint8_t *pData, uint16_t Size, uint32_t Timeout);
int HAL_UART_Receive(USART_TypeDef* USARTx, uint8_t *pData, uint16_t Size, uint32_t Timeout);
int Service_Call_42(void);
int Service_Call_Default(void);
int Service_Call_43(void);

#endif /* MAIN_H_ */
