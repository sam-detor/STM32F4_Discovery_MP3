
#include "stm32f4xx_conf.h"
#define Audio44100HzSettings 271,2,6,0
static void WriteRegister(uint8_t address, uint8_t value);
void SetAudioVolume(int volume);
void InitializeAudio(int plln, int pllr, int i2sdiv, int i2sodd);