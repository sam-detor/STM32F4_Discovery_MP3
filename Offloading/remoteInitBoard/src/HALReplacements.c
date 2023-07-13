#include "RecieveData.h"

#define UART_FLAG_TXE                       ((uint32_t)USART_SR_TXE)
#define UART_FLAG_TC                        ((uint32_t)USART_SR_TC)
#define UART_FLAG_RXNE                      ((uint32_t)USART_SR_RXNE)
#define MAX_DELAY                           1000000 //arbitrary val right now
#define TRUE                                1
#define FALSE                               0

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



//global Vars
uint8_t transmitFree = 1;
uint8_t recieveFree = 1;

//function defs
static int UART_WaitOnFlagUntilTimeout(USART_TypeDef* USARTx, uint32_t Flag, FlagStatus Status,
                                                     uint32_t Tickstart, uint32_t Timeout);


/** //NEED TO FIX
  * @brief  Sends an amount of data in blocking mode.
  * @note   When UART parity is not enabled (PCE = 0), and Word Length is configured to 9 bits (M1-M0 = 01),
  *         the sent data is handled as a set of u16. In this case, Size must indicate the number
  *         of u16 provided through pData.
  * @param  USARTx Pointer to a UART_TypeDef structure that contains
  *               the configuration information for the specified UART module.
  * @param  pData Pointer to data buffer (u8 or u16 data elements).
  * @param  Size  Amount of data elements (u8 or u16) to be sent
  * @param  Timeout Timeout duration
  * @retval HAL status
  */
int HAL_UART_Transmit(USART_TypeDef* USARTx, const uint8_t *pData, uint16_t Size, uint32_t Timeout)
{
    const uint8_t  *pdata8bits = pData;
    uint32_t tickstart = 0; 
    uint16_t dataTransfered = 0;

    //makes sure only one transfer happens at a time
    if(transmitFree)
    {
        if ((pData == NULL) || (Size == 0U))
        {
            return BAD_PARAM;
        }

        transmitFree = FALSE;
    }
    else
    {
        return BUSY;
    }

    tickstart = *tick_ms; /* Init tickstart for timeout management */

    while (dataTransfered < Size)
    {
      if (UART_WaitOnFlagUntilTimeout(USARTx, UART_FLAG_TXE, RESET, tickstart, Timeout) != 0)
      {
        transmitFree = TRUE;
        return TIMEOUT;
      }
      USART_SendData(USARTx, *pdata8bits);
      //USARTx->DR = (uint8_t)(*pdata8bits & 0xFFU);
      pdata8bits++;
      dataTransfered++;
    }

    if (UART_WaitOnFlagUntilTimeout(USARTx, UART_FLAG_TC, RESET, tickstart, Timeout) != 0)
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
  * @note   When UART parity is not enabled (PCE = 0), and Word Length is configured to 9 bits (M1-M0 = 01),
  *         the received data is handled as a set of u16. In this case, Size must indicate the number
  *         of u16 available through pData.
  * @param  USARTx Pointer to a UART_TypeDef structure that contains
  *               the configuration information for the specified UART module.
  * @param  pData Pointer to data buffer (u8 or u16 data elements).
  * @param  Size  Amount of data elements (u8 or u16) to be received.
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
  * @retval HAL status
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