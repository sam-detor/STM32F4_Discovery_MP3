/**
 * @file HALReplacements.c
 * @author Sam Detor (sam.detor@yale.edu)
 * @brief This file re-implements HAL_UART_Receive and HAL_UART_Transmit so they can be used seperately from the rest of the HAL library. The macros
 *        and #defines were all copied from STM32F4xx_HAL_Driver/Inc/stm32f4xx_hal_uart.h. HAL_UART_Receive, HAL_UART_Transmit, and UART_WaitOnFlagUntilTimeout
 *        are modified versions of the methods that can be found here: STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_uart.c.
 * @version 0.1
 * @date 2023-08-03
 * 
 * @copyright Copyright (c) 2023
 * 
 */

//Includes

#include "RecieveData.h"
#include "stm32f4xx_usart.h"

//Constants

#define UART_FLAG_TXE                       ((uint32_t)USART_SR_TXE)
#define UART_FLAG_TC                        ((uint32_t)USART_SR_TC)
#define UART_FLAG_RXNE                      ((uint32_t)USART_SR_RXNE)
#define MAX_DELAY                           1000000 //arbitrary val right now
#define TRUE                                1
#define FALSE                               0

//Macros

/** @brief  Checks whether the specified UART flag is set or not.
  * @param  __HANDLE__ specifies the UART Handle.
  *         UART Handle selects the USARTx or UARTy peripheral
  *         (USART,UART availability and x,y values depending on device).
  * @param  __FLAG__ specifies the flag to check.
  *        This parameter can be one of the following values:
  *            @arg UART_FLAG_CTS:  CTS Change flag (not available for UART4 and UART5)
  *            @arg UART_FLAG_LBD:  LIN Break detection flag
  *            @arg UART_FLAG_TXE:  Transmit data register empty flag
  *            @arg UART_FLAG_TC:   Transmission Complete flag
  *            @arg UART_FLAG_RXNE: Receive data register not empty flag
  *            @arg UART_FLAG_IDLE: Idle Line detection flag
  *            @arg UART_FLAG_ORE:  Overrun Error flag
  *            @arg UART_FLAG_NE:   Noise Error flag
  *            @arg UART_FLAG_FE:   Framing Error flag
  *            @arg UART_FLAG_PE:   Parity Error flag
  * @retval The new state of __FLAG__ (TRUE or FALSE).
  */
#define __HAL_UART_GET_FLAG(__HANDLE__, __FLAG__) (((__HANDLE__)->SR & (__FLAG__)) == (__FLAG__))

/* Atomic 32-bit register access macro to clear one or several bits */
#define ATOMIC_CLEAR_BIT(REG, BIT)                           \
  do {                                                       \
    uint32_t val;                                            \
    do {                                                     \
      val = __LDREXW((__IO uint32_t *)&(REG)) & ~(BIT);      \
    } while ((__STREXW(val,(__IO uint32_t *)&(REG))) != 0U); \
  } while(0)

/**
  * @brief  This function handles UART Communication Timeout. It waits
  *         until a flag is no longer in the specified status.
  * @param  USARTx  Pointer to a UART_TypeDef structure that contains
  *                the configuration information for the specified UART module.
  * @param  Flag specifies the UART flag to check.
  * @param  Status The actual Flag status (SET or RESET).
  * @param  Tickstart Tick start value
  * @param  Timeout Timeout duration
  * @retval  0 on sucess, TIMEOUT (-1) on timeout
  */
#pragma GCC push_options
#pragma GCC optimize ("no-peel-loops")
static int __attribute__((noinline)) UART_WaitOnFlagUntilTimeout(USART_TypeDef* USARTx, uint32_t Flag, FlagStatus Status,
                                                     uint32_t Tickstart, uint32_t Timeout)
{
  /* Wait until flag is set */
  while ((__HAL_UART_GET_FLAG(USARTx, Flag) ? SET : RESET) == Status)
  {
    /* Check for the Timeout */
    if (Timeout != MAX_DELAY)
    {
      if ((Timeout == 0U) || ((*tick_ms - Tickstart) > Timeout))
      {
        /* Disable TXE, RXNE, PE and ERR (Frame error, noise error, overrun error) interrupts for the interrupt process */
        ATOMIC_CLEAR_BIT(USARTx->CR1, (USART_CR1_RXNEIE | USART_CR1_PEIE | USART_CR1_TXEIE));
        ATOMIC_CLEAR_BIT(USARTx->CR3, USART_CR3_EIE);

        return TIMEOUT;
      }
    }
  }
  return 0;
}
#pragma GCC pop_options

/**
  * @brief  Transmits single data through the USARTx peripheral.
  * @param  USARTx: where x can be 1, 2, 3, 4, 5 or 6 to select the USART or 
  *         UART peripheral.
  * @param  Data: the data to transmit.
  * @retval None
  */
static void USART_SendData(USART_TypeDef* USARTx, uint16_t Data)
{
  /* Check the parameters */
  assert_param(IS_USART_ALL_PERIPH(USARTx));
  assert_param(IS_USART_DATA(Data)); 
    
  /* Transmit Data */
  USARTx->DR = (Data & (uint16_t)0x01FF);
}

/**
  * @brief  Returns the most recent received data by the USARTx peripheral.
  * @param  USARTx: where x can be 1, 2, 3, 4, 5 or 6 to select the USART or 
  *         UART peripheral.
  * @retval The received data.
  */
static uint16_t USART_ReceiveData(USART_TypeDef* USARTx)
{
  /* Check the parameters */
  assert_param(IS_USART_ALL_PERIPH(USARTx));
  
  /* Receive Data */
  return (uint16_t)(USARTx->DR & (uint16_t)0x01FF);
}


/**
  * @brief  Sends an amount of data in blocking mode. Simplified implementation of the HAL_UART_Transmit method.
  * @param  USARTx Pointer to a UART_TypeDef structure that contains
  *               the configuration information for the specified UART module.
  * @param  pData Pointer to data buffer (u8 data elements).
  * @param  Size  Amount of data elements (u8) to be sent
  * @param  Timeout Timeout duration
  * @retval 0 on sucess, other on error (See error codes in OffloadingFramework/remoteInitBoard/inc/RecieveData.h)
  */
int HAL_UART_Transmit_Byte(USART_TypeDef* USARTx, const uint8_t *pByte, uint32_t Timeout)
{
    uint32_t tickstart = 0; 

    tickstart = *tick_ms; /* Init tickstart for timeout management */
                          //tick_ms is a pointer to a value that increments every 1ms, is defined in RemoteInitBoard.c

    if (UART_WaitOnFlagUntilTimeout(USARTx, UART_FLAG_TXE, RESET, tickstart, Timeout) != 0) //if it hasn't timed-out yet
      return TIMEOUT;

    USART_SendData(USARTx, *pByte);

    if (UART_WaitOnFlagUntilTimeout(USARTx, UART_FLAG_TC, RESET, tickstart, Timeout) != 0) //free service and return if reached timeout
      return TIMEOUT;

    return 0;
}

/**
  * @brief  Receives a byte in blocking mode.
  * @param  USARTx Pointer to a UART_TypeDef structure that contains
  *               the configuration information for the specified UART module.
  * @param  pByte Pointer to the byte to be received
  * @param  Timeout Timeout duration
  * @retval HAL status
  */
int HAL_UART_Receive_Byte(USART_TypeDef* USARTx, uint8_t *pByte, uint32_t Timeout)
{
  uint32_t tickstart = 0U;

  /* Init tickstart for timeout management */
  tickstart = *tick_ms;

  if (UART_WaitOnFlagUntilTimeout(USARTx, UART_FLAG_RXNE, RESET, tickstart, Timeout) != 0)
    return TIMEOUT;
  
  *pByte = USART_ReceiveData(UART4); // (uint8_t)(USARTx->DR & (uint8_t)0x00FF);

  return 0;
}
