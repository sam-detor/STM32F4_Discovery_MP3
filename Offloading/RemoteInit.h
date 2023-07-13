//Remote Init Constants

//Board Constants
#define RAM_CODE_START 0x20000910 //MUST BE IN HEX
#define INIT_BIN_SIZE 2652
#define RAM_STACK_SIZE 0x400 //MUST BE IN HEX
#define WORD_SIZE 4

//PC constants
#define BAUD_RATE 115200
#define DEVICE_FILE "/dev/cu.usbserial-0001"
#define BIN_FILE "/Users/samdetor/STM32F4_Discovery_MP3/Offloading/remoteInitPC/bin/InitCode.bin"
#define TIMEOUT_MS

//Both
#define COMMS_TIMEOUT 400
