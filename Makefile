# Project sources
SRCS = main.c stm32f4xx_it.c system_stm32f4xx.c syscalls.c utils.c 
SRCS += Audio.c mp3_data.c HALReplacements.c PacketHandling.c RecieveData.c

# all the files will be generated with this name (main.elf, main.bin, main.hex, etc)

PROJ_NAME=stm32f4_discovery_mp3
OUTPATH=build

###################################################

# Check for valid float argument
# NOTE that you have to run make clan after
# changing these as hardfloat and softfloat are not
# binary compatible
ifneq ($(FLOAT_TYPE), hard)
ifneq ($(FLOAT_TYPE), soft)
override FLOAT_TYPE = hard
#override FLOAT_TYPE = soft
endif
endif

###################################################

PREFIX = /Applications/ARM/bin/
CC=$ arm-none-eabi-gcc
OBJCOPY=$ arm-none-eabi-objcopy
SIZE=$ arm-none-eabi-size

BIN = $(OBJCOPY) -O binary -S

CFLAGS  = -std=gnu99 -g -Og -Wall -Tstm32_flash.ld
CFLAGS += -mlittle-endian -mthumb -mthumb-interwork -nostartfiles -mcpu=cortex-m4

ifeq ($(FLOAT_TYPE), hard)
CFLAGS += -fsingle-precision-constant -Wdouble-promotion
CFLAGS += -mfpu=fpv4-sp-d16 -mfloat-abi=hard
#CFLAGS += -mfpu=fpv4-sp-d16 -mfloat-abi=softfp
else
CFLAGS += -msoft-float
endif

###################################################

vpath %.c src
vpath %.a lib


CFLAGS += -Iinc -Ilib -Ilib/inc 
CFLAGS += -Ilib/inc/core -Ilib/inc/peripherals

# MP3
CFLAGS += -Ihelix/pub

# add startup file to build
SRCS += lib/startup_stm32f4xx.s

# Libraries to use
LIBS = -Llib -lstm32f4 -Lhelix -lhelix -lm

OBJS = $(SRCS:.c=.o)

###################################################

.PHONY: lib proj

all: lib proj
	$(SIZE) $(OUTPATH)/$(PROJ_NAME).elf
lib:
	$(MAKE) -C lib FLOAT_TYPE=$(FLOAT_TYPE)
	$(MAKE) -C helix FLOAT_TYPE=$(FLOAT_TYPE)

proj: 	$(OUTPATH)/$(PROJ_NAME).elf

$(OUTPATH)/$(PROJ_NAME).elf: $(SRCS)
	$(CC) $(CFLAGS) $^ -o $@ $(LIBS)
	$(OBJCOPY) -O ihex $(OUTPATH)/$(PROJ_NAME).elf $(OUTPATH)/$(PROJ_NAME).hex
	$(OBJCOPY) -O binary $(OUTPATH)/$(PROJ_NAME).elf $(OUTPATH)/$(PROJ_NAME).bin

$(OUTPATH)/%.bin: $(OUTPATH)/%.elf | $(OUTPATH)
	$(BIN) $< $@

clean:
	rm -f *.o
	rm -f $(OUTPATH)/$(PROJ_NAME).elf
	rm -f $(OUTPATH)/$(PROJ_NAME).hex
	rm -f $(OUTPATH)/$(PROJ_NAME).bin
	$(MAKE) clean -C lib
	$(MAKE) clean -C helix

OPENOCD				?= openocd
OPENOCD_INTERFACE	?= interface/stlink-v2-1.cfg
OPENOCD_TARGET    	?= target/stm32f4x.cfg
OPENOCD_CMDS		?=
LOAD_ADDRESS		?= 0x8000000
PROG				?= $(OUTPATH)/$(PROJ_NAME)
DBG                 ?= arm-none-eabi-gdb

flash:
	$(OPENOCD) -d2 -f $(OPENOCD_INTERFACE) $(OPENOCD_CMDS) -f $(OPENOCD_TARGET) -c init -c targets -c "reset halt" \
                 -c "flash write_image erase $(PROG).bin $(LOAD_ADDRESS) bin" \
                 -c "verify_image $(PROG).bin $(LOAD_ADDRESS) bin" -c "reset run" -c shutdown

debug:
	@$(DBG) --eval-command="target extended-remote :4242" \
	$(PROG).elf

#stuff for generating init bin
ICFLAGS  = -std=gnu99 -g -Og -Wall -Tstm32_init.ld
ICFLAGS += -mlittle-endian -mthumb -mthumb-interwork -nostartfiles -mcpu=cortex-m4
ICFLAGS += -fsingle-precision-constant -Wdouble-promotion
ICFLAGS += -mfpu=fpv4-sp-d16 -mfloat-abi=hard
ICFLAGS += -Iinc -Ilib -Ilib/inc 
ICFLAGS += -Ilib/inc/core -Ilib/inc/peripherals

ISRCS = /Users/samdetor/STM32F4_Discovery_MP3/src/InitCode.c /Users/samdetor/STM32F4_Discovery_MP3/src/Audio.c

init-code:
	$(CC) $(ICFLAGS) /Users/samdetor/STM32F4_Discovery_MP3/src/InitCode.c -o $(OUTPATH)/InitCode -Llib -lstm32f4
	$(OBJCOPY) -O binary $(OUTPATH)/InitCode.elf $(OUTPATH)/InitCode.bin
	
$(OUTPATH)/InitCode.elf:
	$(CC) $(ICFLAGS) $(ISRCS) -o $(OUTPATH)/InitCode -Llib -lstm32f4
	$(OBJCOPY) -O binary $(OUTPATH)/InitCode $(OUTPATH)/InitCode.bin	

init-code-2: $(OUTPATH)/InitCode.elf

InitCode-asm: arm -O -D $(OUTPATH)/InitCode.bin $(OUTPATH)/InitCode.asm
