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


//Global Variables

uint8_t transmitFree = 1;
uint8_t recieveFree = 1;

//function definitions

static int UART_WaitOnFlagUntilTimeout(USART_TypeDef* USARTx, uint32_t Flag, FlagStatus Status,
                                                     uint32_t Tickstart, uint32_t Timeout);


/**
  * @brief  Sends an amount of data in blocking mode. Simplified implementation of the HAL_UART_Transmit method.
  * @param  USARTx Pointer to a UART_TypeDef structure that contains
  *               the configuration information for the specified UART module.
  * @param  pData Pointer to data buffer (u8 data elements).
  * @param  Size  Amount of data elements (u8) to be sent
  * @param  Timeout Timeout duration
  * @retval 0 on sucess, other on error (See error codes in OffloadingFramework/remoteInitBoard/inc/RecieveData.h)
  */
int HAL_UART_Transmit(USART_TypeDef* USARTx, const uint8_t *pData, uint16_t Size, uint32_t Timeout)
{
    const uint8_t  *pdata8bits = pData;
    uint32_t tickstart = 0; 
    uint16_t dataTransfered = 0;

    //makes sure only one transfer happens at a time
    if(transmitFree)
    {
        if ((pData == NULL) || (Size == 0U)) //if theres no data or size is zero, return with error
        {
            return BAD_PARAM;
        }

        transmitFree = FALSE;
    }
    else
    {
        return BUSY; //someone else is transmitting right now
    }

    tickstart = *tick_ms; /* Init tickstart for timeout management */
                          //tick_ms is a pointer to a value that increments every 1ms, is defined in RemoteInitBoard.c

    while (dataTransfered < Size)
    {
      if (UART_WaitOnFlagUntilTimeout(USARTx, UART_FLAG_TXE, RESET, tickstart, Timeout) != 0) //if it hasn't timed-out yet
      {
        transmitFree = TRUE; //allow others to transmit now
        return TIMEOUT;
      }
      USART_SendData(USARTx, *pdata8bits); //send the data one byte at a time, USART_SendData defined in stm32f4xx_usart.c
      pdata8bits++;
      dataTransfered++;
    }

    if (UART_WaitOnFlagUntilTimeout(USARTx, UART_FLAG_TC, RESET, tickstart, Timeout) != 0) //free service and return if reached timeout
    {
      transmitFree = TRUE;
      return TIMEOUT;
    }

    /* At end of Tx process, restore trasmitFree to true */
    transmitFree = TRUE;

    return 0;
}

/**
  * @brief  Receives an amount of data in blocking mode.
  * @param  USARTx Pointer to a UART_TypeDef structure that contains
  *               the configuration information for the specified UART module.
  * @param  pData Pointer to data buffer (u8 elements).
  * @param  Size  Amount of data elements (u8) to be received.
  * @param  Timeout Timeout duration
  * @retval HAL status
  */
int HAL_UART_Receive(USART_TypeDef* USARTx, uint8_t *pData, uint16_t Size, uint32_t Timeout)
{
  uint8_t  *pdata8bits = pData;
  uint32_t tickstart = 0U;
  uint32_t dataRecieved = 0;

  /* Check that a Rx process is not already ongoing */
  if (recieveFree)
  {
    if ((pData == NULL) || (Size == 0U))
    {
      return  BAD_PARAM;
    }

   recieveFree = FALSE;

    /* Init tickstart for timeout management */
    tickstart = *tick_ms;

  
    /* Check the remain data to be received */
    while (dataRecieved < Size)
    {
      if (UART_WaitOnFlagUntilTimeout(USARTx, UART_FLAG_RXNE, RESET, tickstart, Timeout) != 0)
      {
        recieveFree = TRUE;
        return TIMEOUT;
      }
      
      *pdata8bits = USART_ReceiveData(UART4); //(uint8_t)(USARTx->DR & (uint8_t)0x00FF);
      pdata8bits++;
      dataRecieved++;
    }

    ///reciever is now free for next opp
    recieveFree = TRUE;

    return 0;

  }
  else
  {
    return BUSY;
  }
}

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
static int UART_WaitOnFlagUntilTimeout(USART_TypeDef* USARTx, uint32_t Flag, FlagStatus Status,
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