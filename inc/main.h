/*
 * main.h
 *
 *  Created on: 10 jul 2012
 *      Author: BenjaminVe
 */

#ifndef MAIN_H_
#define MAIN_H_

// Function prototypes
void timing_handler();

//functions from the remoteInitBoard lib
int remoteInit(USART_TypeDef* USARTx, volatile uint32_t* systick_ms);
void remoteInitSVC(void);
int HAL_UART_Transmit(USART_TypeDef* USARTx, const uint8_t *pData, uint16_t Size, uint32_t Timeout);
int HAL_UART_Receive(USART_TypeDef* USARTx, uint8_t *pData, uint16_t Size, uint32_t Timeout);

#endif /* MAIN_H_ */
