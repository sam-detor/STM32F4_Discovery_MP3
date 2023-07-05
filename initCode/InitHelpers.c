#include "Init.h"
void InitializeAudio(int plln, int pllr, int i2sdiv, int i2sodd) {
	GPIO_InitTypeDef  GPIO_InitStructure;

	// Turn on peripherals.
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA, ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOB, ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOC, ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOD, ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_DMA1, ENABLE);

	RCC_APB1PeriphClockCmd(RCC_APB1Periph_I2C1, ENABLE);
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_SPI3, ENABLE);

	// Configure reset pin.
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_4;;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
	GPIO_Init(GPIOD, &GPIO_InitStructure);

	// Configure I2C SCL and SDA pins.
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_6 | GPIO_Pin_9;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
	GPIO_InitStructure.GPIO_OType = GPIO_OType_OD;
	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
	GPIO_Init(GPIOB, &GPIO_InitStructure);

	GPIO_PinAFConfig(GPIOB, GPIO_PinSource6, GPIO_AF_I2C1);
	GPIO_PinAFConfig(GPIOB, GPIO_PinSource9, GPIO_AF_I2C1);

	// Configure I2S MCK, SCK, SD pins.
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_7 | GPIO_Pin_10 | GPIO_Pin_12;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
	GPIO_Init(GPIOC, &GPIO_InitStructure);

	GPIO_PinAFConfig(GPIOC, GPIO_PinSource7, GPIO_AF_SPI3);
	GPIO_PinAFConfig(GPIOC, GPIO_PinSource10, GPIO_AF_SPI3);
	GPIO_PinAFConfig(GPIOC, GPIO_PinSource12, GPIO_AF_SPI3);

	// Configure I2S WS pin.
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_4;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
	GPIO_Init(GPIOA, &GPIO_InitStructure);

	GPIO_PinAFConfig(GPIOA, GPIO_PinSource4, GPIO_AF_SPI3);

	// Reset the codec.
	GPIOD ->BSRRH = 1 << 4;
	for (volatile int i = 0; i < 0x4fff; i++) {
		__asm__ volatile("nop");
	}
	GPIOD ->BSRRL = 1 << 4;

	// Reset I2C.
	RCC_APB1PeriphResetCmd(RCC_APB1Periph_I2C1, ENABLE);
	RCC_APB1PeriphResetCmd(RCC_APB1Periph_I2C1, DISABLE);

	// Configure I2C.
	uint32_t pclk1 = 42000000;

	I2C1 ->CR2 = pclk1 / 1000000; // Configure frequency and disable interrupts and DMA.
	I2C1 ->OAR1 = I2C_OAR1_ADDMODE | 0x33;

	// Configure I2C speed in standard mode.
	const uint32_t i2c_speed = 100000;
	int ccrspeed = pclk1 / (i2c_speed * 2);
	if (ccrspeed < 4) {
		ccrspeed = 4;
	}
	I2C1 ->CCR = ccrspeed;
	I2C1 ->TRISE = pclk1 / 1000000 + 1;

	I2C1 ->CR1 = I2C_CR1_ACK | I2C_CR1_PE; // Enable and configure the I2C peripheral.

	// Configure codec.
	WriteRegister(0x02, 0x01); // Keep codec powered off.
	WriteRegister(0x04, 0xaf); // SPK always off and HP always on.

	WriteRegister(0x05, 0x81); // Clock configuration: Auto detection.
	WriteRegister(0x06, 0x04); // Set slave mode and Philips audio standard.

	SetAudioVolume(0xff);

	// Power on the codec.
	WriteRegister(0x02, 0x9e);

	// Configure codec for fast shutdown.
	WriteRegister(0x0a, 0x00); // Disable the analog soft ramp.
	WriteRegister(0x0e, 0x04); // Disable the digital soft ramp.

	WriteRegister(0x27, 0x00); // Disable the limiter attack level.
	WriteRegister(0x1f, 0x0f); // Adjust bass and treble levels.

	WriteRegister(0x1a, 0x0a); // Adjust PCM volume level.
	WriteRegister(0x1b, 0x0a);

	// Disable I2S.
	SPI3 ->I2SCFGR = 0;

	// I2S clock configuration
	RCC ->CFGR &= ~RCC_CFGR_I2SSRC; // PLLI2S clock used as I2S clock source.
	RCC ->PLLI2SCFGR = (pllr << 28) | (plln << 6);

	// Enable PLLI2S and wait until it is ready.
	RCC ->CR |= RCC_CR_PLLI2SON;
	while (!(RCC ->CR & RCC_CR_PLLI2SRDY ))
		;

	// Configure I2S.
	SPI3 ->I2SPR = i2sdiv | (i2sodd << 8) | SPI_I2SPR_MCKOE;
	SPI3 ->I2SCFGR = SPI_I2SCFGR_I2SMOD | SPI_I2SCFGR_I2SCFG_1
			| SPI_I2SCFGR_I2SE; // Master transmitter, Phillips mode, 16 bit values, clock polarity low, enable.

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

void SetAudioVolume(int volume) {
	WriteRegister(0x20, (volume + 0x19) & 0xff);
	WriteRegister(0x21, (volume + 0x19) & 0xff);
}