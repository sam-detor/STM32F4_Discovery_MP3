/**
 * @file RemoteInitBoard.c
 * @author Sam Detor (sam.detor@yale.edu)
 * @brief All the user facing methods for the offloading framework. These methods are meant to go in the appropriate places in the user's stm32f4 code. See the
 * 	      the framework Readme for more information on where to call these methods in user code.
 * @version 0.1
 * @date 2023-08-03
 * 
 * @copyright Copyright (c) 2023
 * 
 */
#include "../inc/RemoteInitBoard.h"


//Global Vars
uint32_t ramStack; //global vars where the RAM code stack and main stack are stored
uint32_t mainStack;
volatile uint32_t* tick_ms; //pointer to a variable that increments every ms

//function declarations
int doubleWordAlignStack(uint32_t * stack);

/**
 * @brief This method pings the PC (via UART) for the offloaded code, downloads it via the recieve method (defined in RecieveData.c), then
 * 		  triggers the execution of that RAM code. This method does not return until the RAM code has been executed
 * 
 * @param USARTx a pointer to a correctly initialized USART_Typedef* 
 * @param systick_ms a pointer to a uint32_t that increments every ms, should point to a variable updated by systick in the user code 
 * @return 0 on sucess, other on fail (see error code map in RecieveData.h for specific details)
 */
int remoteInit(USART_TypeDef* USARTx, volatile uint32_t* systick_ms)
{
	//variable defs
	int ret;
	size_t bytesRecieved;

	//storing the pointer to the var that increments every ms in the tick_ms global var
	tick_ms = systick_ms; // *tick_ms is the measure of time in this library

	//pinging the pc for the offloaded code
	ret = sendStartPacket(USARTx);
	if (ret < 0)
	{
		return ret;
	}

	//calculates how much space there is in RAM for the code
	size_t RAMSpace = RAM_SIZE - (RAM_START - ((uint32_t) &_ebss)) - (RAM_STACK_SIZE * 2); // Total RAM - data and bss section - space for main stack and ram code stack

	while (1) //hangs and waits for the PC to send the init code
	{
		ret = recieve((uint8_t*) &_ebss, RAMSpace, COMMS_TIMEOUT, USARTx, &bytesRecieved); //recieve the RAM code from PC
		if (ret == 0) //if the code is correctly recieved
		{
			//setting the ramStack value
			ramStack = ((uint32_t) &_ebss) + bytesRecieved + RAM_STACK_SIZE; //stack sits directly under RAM code
			
			//making sure the RAM stack is double word aligned
			doubleWordAlignStack(&ramStack);

			break;
		}
		else if (ret != TIMEOUT) //if recieve fails due to something other than a timeout
		{
			return ret;
		}
		
	}

	//triggers an exception, which will eventually lead to the execution of the newly downloaded code, and immediately leads to the execution of remoteInitSVC()
	asm("svc #42");

	return 0;

}
/**
 * @brief Checks if the unit32_t pointed to by "stack" is double word aligned. If not, it adds the amount
 * 		  necessary to make it double word aligned
 * 
 * @param stack a uint32_t pointer to the stack value needing to be checked
 * @return 0 
 */
int doubleWordAlignStack(uint32_t * stack)
{
	if (*stack % (2 * WORD_SIZE)) // if its double word aligned (WORD_SIZE is set in RemoteInit.h), do nothing
	{
		return 0;
	}
	else
	{
		*stack = (2 * WORD_SIZE) - (*stack % (2 * WORD_SIZE)) + *stack; //if its not, add the required amt to make it word aligned
		return 0;
	}
}
/**
 * @brief This method saves the main stack pointer in the global variable mainStack, switches the MSP to the ramStack, loads the LR register with
 * 		  the RAM code cleanup method (returnToNormalExecution) and calls the RAM code (the code downloaded in remoteInit)
 * 
 * @return 1 
 */
int executeRAMCode(void)
{
	uint32_t ramCodeStart = ((uint32_t) &_ebss) + 1; //the downloaded code was put right after the bss section in RAM,
	asm(                                             //the addresses are required to end in 1
		"MRS %0, MSP\n\t"
		: "=r" (mainStack)); //save main stack
	asm(
		"MSR MSP, %0\n\t" //switch to RAM code stack
		:
		: "r" (ramStack));
	asm(
		"LDR  lr, =returnToNormalExecution\n\t"); //have the RAM code return to the returnToNormalExecution method
	asm(
		"BX %0\n\t" //branch to RAM code
		:
		: "r" (ramCodeStart));
	return 1;
}
/**
 * @brief The RAM code returns to this method. It switches the code back to the main stack, clears out some junk on the stack from
 * 		  remoteInitSVC, then triggers the exception return back to the end of the remoteInit method
 * 
 * @return 1 
 */
int returnToNormalExecution(void)
{
	asm(
		"MSR MSP, %0\n\t"
		:
		: "r" (mainStack)); //switch back to main stack
	asm(
		"POP {R0}\n\t" //get rid of some extra stack pushes (from calling remoteInitSVC)
		"POP {R0}\n\t" //get rid of some extra stack pushes (from calling remoteInitSVC)
		"POP {LR}\n\t" //pop the LR (the exception return LR) off the stack
		"BX lr\n\t" //perform exception return back into the normal code
	);
	return 1;
}

/**
 * @brief This function will be called in the users SVC_Handler. It parses the stack frame to find the exception number called with svc.
 * 		  If the exception number is 42, it calls executeRAMCode (implemented above), if its not, it returns control to user code. This code
 * 		  was modeled after code found here: https://github.com/gopal-amlekar/stm32f4-SVC-Demo/blob/master/src/isr.s and the author was greatly
 * 	      helped by the coresponding blog post: https://www.iotality.com/armcm-svc/
 * 
 */
void remoteInitSVC(void) //asm statements are split for debugging purposes
{
	asm(
      "MRS	R0, MSP\n\t" //loads the stack pointer into R)
      "LDR R0, [R0,#32]\n\t"); //gets the stacked PC value into R0. This accounts for the extra stuff on the stack due to the call of the remoteInitSVC
                                // method. If this piece of code were to be directly in the user handler, it would be #24
	asm(                      
      "LDRB R0, [R0, #-2]\n\t"); //get the SVC number from the PC value
    asm(
      "CMP		R0, #42\n\t"); //compare that number to 42
    asm(
      "BEQ		condition_true\n\t" //go to condition_true if the the svc number is 42
      "B end \n\t" //go to end if not true
      "condition_true: LDR	R1, =executeRAMCode\n\t" //put the address of executeRAMCode into R1
      "PUSH 	{LR}\n\t" //push the old value of LR onto the stack
	  "BLX		R1\n\t" // call executeRAMCode
	  "end:\n\t"
    );
	return;
}