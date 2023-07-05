#include "Audio.h"
#include "stm32f4xx_conf.h"
#include "stm32f4xx.h"

#include <stdlib.h>

static void WriteRegister(uint8_t address, uint8_t value);
static void StartAudioDMAAndRequestBuffers();
static void StopAudioDMA();

static AudioCallbackFunction *CallbackFunction;
static void *CallbackContext;
static int16_t * volatile NextBufferSamples;
static volatile int NextBufferLength;
static volatile int BufferNumber;
static volatile bool DMARunning;

void InitAudioState()
{
	// Intitialize state.
	CallbackFunction = NULL;
	CallbackContext = NULL;
	NextBufferSamples = NULL;
	NextBufferLength = 0;
	BufferNumber = 0;
	DMARunning = false;
	return;
}

void AudioOn() {
	WriteRegister(0x02, 0x9e);
	SPI3 ->I2SCFGR = SPI_I2SCFGR_I2SMOD | SPI_I2SCFGR_I2SCFG_1
			| SPI_I2SCFGR_I2SE; // Master transmitter, Phillips mode, 16 bit values, clock polarity low, enable.
}

void AudioOff() {
	WriteRegister(0x02, 0x01);
	SPI3 ->I2SCFGR = 0;
}

void SetAudioVolume(int volume) {
	WriteRegister(0x20, (volume + 0x19) & 0xff);
	WriteRegister(0x21, (volume + 0x19) & 0xff);
}

void OutputAudioSample(int16_t sample) {
	while (!(SPI3 ->SR & SPI_SR_TXE ))
		;
	SPI3 ->DR = sample;
}

void OutputAudioSampleWithoutBlocking(int16_t sample) {
	SPI3 ->DR = sample;
}

void PlayAudioWithCallback(AudioCallbackFunction *callback, void *context) {
	StopAudioDMA();

	NVIC_EnableIRQ(DMA1_Stream7_IRQn);
	NVIC_SetPriority(DMA1_Stream7_IRQn, 4);

	SPI3 ->CR2 |= SPI_CR2_TXDMAEN; // Enable I2S TX DMA request.

	CallbackFunction = callback;
	CallbackContext = context;
	BufferNumber = 0;

	if (CallbackFunction)
		CallbackFunction(CallbackContext, BufferNumber);
}

void StopAudio() {
	StopAudioDMA();
	SPI3 ->CR2 &= ~SPI_CR2_TXDMAEN; // Disable I2S TX DMA request.
	NVIC_DisableIRQ(DMA1_Stream7_IRQn);
	CallbackFunction = NULL;
}

void ProvideAudioBuffer(void *samples, int numsamples) {
	while (!ProvideAudioBufferWithoutBlocking(samples, numsamples))
		__asm__ volatile ("wfi");
}

bool ProvideAudioBufferWithoutBlocking(void *samples, int numsamples) {
	if (NextBufferSamples)
		return false;

	NVIC_DisableIRQ(DMA1_Stream7_IRQn);

	NextBufferSamples = samples;
	NextBufferLength = numsamples;

	if (!DMARunning)
		StartAudioDMAAndRequestBuffers();

	NVIC_EnableIRQ(DMA1_Stream7_IRQn);

	return true;
}

static void WriteRegister(uint8_t address, uint8_t value) {
	while (I2C1 ->SR2 & I2C_SR2_BUSY )
		;

	I2C1 ->CR1 |= I2C_CR1_START; // Start the transfer sequence.
	while (!(I2C1 ->SR1 & I2C_SR1_SB ))
		; // Wait for start bit.

	I2C1 ->DR = 0x94;
	while (!(I2C1 ->SR1 & I2C_SR1_ADDR ))
		; // Wait for master transmitter mode.
	I2C1 ->SR2;

	I2C1 ->DR = address; // Transmit the address to write to.
	while (!(I2C1 ->SR1 & I2C_SR1_TXE ))
		; // Wait for byte to move to shift register.

	I2C1 ->DR = value; // Transmit the value.

	while (!(I2C1 ->SR1 & I2C_SR1_BTF ))
		; // Wait for all bytes to finish.
	I2C1 ->CR1 |= I2C_CR1_STOP; // End the transfer sequence.
}

static void StartAudioDMAAndRequestBuffers() {
	// Configure DMA stream.
	DMA1_Stream7 ->CR = (0 * DMA_SxCR_CHSEL_0 ) | // Channel 0
			(1 * DMA_SxCR_PL_0 ) | // Priority 1
			(1 * DMA_SxCR_PSIZE_0 ) | // PSIZE = 16 bit
			(1 * DMA_SxCR_MSIZE_0 ) | // MSIZE = 16 bit
			DMA_SxCR_MINC | // Increase memory address
			(1 * DMA_SxCR_DIR_0 ) | // Memory to peripheral
			DMA_SxCR_TCIE; // Transfer complete interrupt
	DMA1_Stream7 ->NDTR = NextBufferLength;
	DMA1_Stream7 ->PAR = (uint32_t) &SPI3 ->DR;
	DMA1_Stream7 ->M0AR = (uint32_t) NextBufferSamples;
	DMA1_Stream7 ->FCR = DMA_SxFCR_DMDIS;
	DMA1_Stream7 ->CR |= DMA_SxCR_EN;

	// Update state.
	NextBufferSamples = NULL;
	BufferNumber ^= 1;
	DMARunning = true;

	// Invoke callback if it exists to queue up another buffer.
	if (CallbackFunction)
		CallbackFunction(CallbackContext, BufferNumber);
}

static void StopAudioDMA() {
	DMA1_Stream7 ->CR &= ~DMA_SxCR_EN; // Disable DMA stream.
	while (DMA1_Stream7 ->CR & DMA_SxCR_EN )
		; // Wait for DMA stream to stop.

	DMARunning = false;
}

void DMA1_Stream7_IRQHandler() {
	DMA1 ->HIFCR |= DMA_HIFCR_CTCIF7; // Clear interrupt flag.

	if (NextBufferSamples) {
		StartAudioDMAAndRequestBuffers();
	} else {
		DMARunning = false;
	}
}
