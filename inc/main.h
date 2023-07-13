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

#endif /* MAIN_H_ */
