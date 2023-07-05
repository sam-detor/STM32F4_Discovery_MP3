#include "utils.h"
#include "Audio.h"
#include "mp3dec.h"
#include "main.h"

#define RAM_CODE_START 0x20000910

// Private variables
volatile uint32_t time_var1, time_var2;
MP3FrameInfo mp3FrameInfo;
HMP3Decoder hMP3Decoder;
volatile uint32_t tick_ms;
uint32_t mainStack;
uint32_t ramStack = 0x20001930; //RAM_CODE_START + sizeOfFile + 0x400 + whatever it takes to be double word aligned (just in case)


// Private function prototypes
static void AudioCallback(void *context,int buffer);
void Delay(volatile uint32_t nCount);
void init();
int remoteInit(void);

// External variables
extern const char mp3_data[];

// Some macros
#define MP3_SIZE	687348
#define BUTTON		(GPIOA->IDR & GPIO_Pin_0)

int main(void) {
	
	init();
	int volume = 0;

	//trying to disable internal buffer
	SCnSCB->ACTLR |= SCnSCB_ACTLR_DISDEFWBUF_Msk;

	//enable all fault catching regs
	SCB->SHCSR |= SCB_SHCSR_USGFAULTENA_Msk | SCB_SHCSR_BUSFAULTENA_Msk | SCB_SHCSR_MEMFAULTENA_Msk;

	// Play mp3
	hMP3Decoder = MP3InitDecoder();
	remoteInit();
	GPIO_SetBits(GPIOD, GPIO_Pin_14);
	PlayAudioWithCallback(AudioCallback, 0);

	for(;;) {
		 //Check if user button is pressed
		if (BUTTON) {
			// Debounce
			Delay(10);
			if (BUTTON) {

				// Toggle audio volume
				if (volume) {
					volume = 0;
					SetAudioVolume(0xCF);
				} else {
					volume = 1;
					SetAudioVolume(0xAF);
				}


				while(BUTTON){};
			}
		}
	}
	return 0;
}

/*
 * Called by the audio driver when it is time to provide data to
 * one of the audio buffers (while the other buffer is sent to the
 * CODEC using DMA). One mp3 frame is decoded at a time and
 * provided to the audio driver.
 */
static void AudioCallback(void *context, int buffer) {
	static int16_t audio_buffer0[4096];
	static int16_t audio_buffer1[4096];

	int offset, err;
	int outOfData = 0;
	static const char *read_ptr = mp3_data;
	static int bytes_left = MP3_SIZE;

	int16_t *samples;

	if (buffer) {
		samples = audio_buffer0;
		GPIO_SetBits(GPIOD, GPIO_Pin_13);
		GPIO_ResetBits(GPIOD, GPIO_Pin_14);
	} else {
		samples = audio_buffer1;
		GPIO_SetBits(GPIOD, GPIO_Pin_14);
		GPIO_ResetBits(GPIOD, GPIO_Pin_13);
	}

	offset = MP3FindSyncWord((unsigned char*)read_ptr, bytes_left);
	bytes_left -= offset;

	if (bytes_left <= 10000) {
		read_ptr = mp3_data;
		bytes_left = MP3_SIZE;
		offset = MP3FindSyncWord((unsigned char*)read_ptr, bytes_left);
	}

	read_ptr += offset;
	err = MP3Decode(hMP3Decoder, (unsigned char**)&read_ptr, &bytes_left, samples, 0);

	if (err) {
		/* error occurred */
		switch (err) {
		case ERR_MP3_INDATA_UNDERFLOW:
			outOfData = 1;
			break;
		case ERR_MP3_MAINDATA_UNDERFLOW:
			/* do nothing - next call to decode will provide more mainData */
			break;
		case ERR_MP3_FREE_BITRATE_SYNC:
		default:
			outOfData = 1;
			break;
		}
	} else {
		/* no error */
		MP3GetLastFrameInfo(hMP3Decoder, &mp3FrameInfo);
	}

	if (!outOfData) {
		ProvideAudioBuffer(samples, mp3FrameInfo.outputSamps);
	}
}

void init() { //COULD BE OFFBOARDED TO START
	GPIO_InitTypeDef  GPIO_InitStructure;
	USART_InitTypeDef USART_InitStructure;
	// ---------- SysTick timer -------- //
	if (SysTick_Config(SystemCoreClock / 1000)) {
		// Capture error
		while (1){};
	}

	// Enable full access to FPU (Should be done automatically in system_stm32f4xx.c):
	//SCB->CPACR |= ((3UL << 10*2)|(3UL << 11*2));  // set CP10 and CP11 Full Access
	/* For the test init
	// GPIOD Periph clock enable
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOD, ENABLE);

	// Configure PD12, PD13, PD14 and PD15 in output pushpull mode
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_12 | GPIO_Pin_13| GPIO_Pin_14| GPIO_Pin_15;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_100MHz;
	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
	GPIO_Init(GPIOD, &GPIO_InitStructure);
	*/


	// ------ UART ------ //

	// Clock
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_UART4, ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOC, ENABLE);

	// IO
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_10 | GPIO_Pin_11;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_100MHz;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
	GPIO_Init(GPIOC, &GPIO_InitStructure);

	GPIO_PinAFConfig(GPIOC, GPIO_PinSource10, GPIO_AF_UART4);
	GPIO_PinAFConfig(GPIOC, GPIO_PinSource11, GPIO_AF_UART4);

	// Conf
	USART_InitStructure.USART_BaudRate = 115200;
	USART_InitStructure.USART_WordLength = USART_WordLength_8b;
	USART_InitStructure.USART_StopBits = USART_StopBits_1;
	USART_InitStructure.USART_Parity = USART_Parity_No;
	USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
	USART_InitStructure.USART_Mode = USART_Mode_Tx | USART_Mode_Rx;
	USART_Init(UART4, &USART_InitStructure);

	// Enable
	USART_Cmd(UART4, ENABLE);
}

/*
 * Called from systick handler
 */
void timing_handler() {
	if (time_var1) {
		time_var1--;
	}

	time_var2++;
	tick_ms++;
}

/**
 * @brief Return the systick val in ms
 * 
 * @return
 */
uint32_t getTick()
{
	return tick_ms;
}


/*
 * Delay a number of systick cycles
 */
void Delay(volatile uint32_t nCount) {
	time_var1 = nCount;

	while(time_var1){};
}

/*
 * Dummy function to avoid compiler error
 */
void _init() {

}

int Service_Call_42(void)
{
	uint32_t ramCodeStart = 0x20000911;
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
		"POP {LR}\n\t" //pop the LR (the exception return LR) off the stack
		"BX lr\n\t" //perform exception return back into the normal code
	);
	return 1;
}

int Service_Call_Default(void)
{
	//GPIO_SetBits(GPIOD, GPIO_Pin_14);
	return 1;
}

int remoteInit(void)
{
	int ret = -1;
	int sizeOfFile = 3092;
	while (1)
	{
		ret = recieve((uint8_t*) RAM_CODE_START , sizeOfFile, 400, UART4); //recieve the RAM code from PC
		if (ret == 0)
		{
			break;
		}
		else if (ret != -1)
		{
			return -6;
		}
		
	}

	asm(
		"svc #42"); //triggers exception and calls Service_Call_42 (Calls RAM code)


}