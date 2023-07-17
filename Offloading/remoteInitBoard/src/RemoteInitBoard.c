#include "RemoteInitBoard.h"


//Global Vars
uint32_t ramStack;// = RAM_CODE_START + INIT_BIN_SIZE + RAM_STACK_SIZE; //RAM_CODE_START + sizeOfFile + 0x400 + whatever it takes to be double word aligned (just in case)
uint32_t mainStack;
volatile uint32_t* tick_ms;

//function declarations
int doubleWordAlignStack(uint32_t * stack);

int remoteInit(USART_TypeDef* USARTx, volatile uint32_t* systick_ms)
{
	int ret;
	size_t bytesRecieved;

	//setting the address of the systik var
	tick_ms = systick_ms;

	//pinging the pc for the code
	ret = sendStartPacket(USARTx);
	if (ret < 0)
	{
		return -6;
	}

	size_t RAMSpace = RAM_SIZE - (RAM_START - ((uint32_t) &_ebss)) - (RAM_STACK_SIZE * 2); //calculates how much space there is in RAM for the code

	while (1)
	{
		ret = recieve((uint8_t*) &_ebss, RAMSpace, COMMS_TIMEOUT, USARTx, &bytesRecieved); //recieve the RAM code from PC
		if (ret == 0)
		{
			//setting the ramStack value
			ramStack = ((uint32_t) &_ebss) + bytesRecieved + RAM_STACK_SIZE;
			
			//making sure the RAM stack is double word aligned
			doubleWordAlignStack(&ramStack);

			break;
		}
		else if (ret != -1)
		{
			return ret;
		}
		
	}

	asm(
		"svc #42"); //triggers exception and calls Service_Call_42 (Calls RAM code)

	return 0;

}

int doubleWordAlignStack(uint32_t * stack)
{
	if (*stack % (2 * WORD_SIZE))
	{
		return 0;
	}
	else
	{
		*stack = (2 * WORD_SIZE) - (*stack % (2 * WORD_SIZE)) + *stack;
		return 0;
	}
}

int Service_Call_42(void)
{
	uint32_t ramCodeStart = ((uint32_t) &_ebss) + 1;
	asm(
		"MRS %0, MSP\n\t"
		: "=r" (mainStack)); //save main stakc
	asm(
		"MSR MSP, %0\n\t" //switch to RAM stack
		:
		: "r" (ramStack));
	asm(
		"LDR  lr, =Service_Call_43\n\t"); //have the RAM code return to the Service_Call_43 method
	asm(
		"BX %0\n\t" //branch to RAM code
		:
		: "r" (ramCodeStart));
	return 1;
}

int Service_Call_43(void)
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

void remoteInitSVC(void)
{
	asm(
      "MRS	R0, MSP\n\t"
      "LDR R0, [R0,#32]\n\t");
    asm(
      "LDRB R0, [R0, #-2]\n\t");
    asm(
      "CMP		R0, #42\n\t");
    asm(
      "BEQ		condition_true\n\t"
      "B end \n\t"
      "condition_true: LDR	R1, =Service_Call_42\n\t"
      "PUSH 	{LR}\n\t"
	  "BLX		R1\n\t"
	  "POP		{PC}\n\t"
	  "end:\n\t"
    );
	return;
}