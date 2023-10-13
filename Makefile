# Project sources
SRCS = main.c stm32f4xx_it.c system_stm32f4xx.c syscalls.c utils.c 
SRCS += Audio.c mp3_data.c

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

CFLAGS  = -std=gnu99 -g -O2 -Wall
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

# Flags to remove unused functions
CFLAGS += -ffunction-sections -Wl,--gc-section #-Wl,--print-gc-sections

INIT_BIN_SRCS = $(SRCS)

# add startup file to build
#SRCS += lib/startup_stm32f4xx.s

#add init_bin startup file
INIT_BIN_SRCS += OffloadingFramework/initBinStartUp.s

# Libraries to use
LIBS = -Llib -lstm32f4 -Lhelix -lhelix -lm -LOffloadingFramework/RemoteInitBoard/build -lremoteInitBoard #I added the last two

OBJS = $(SRCS:.c=.o)

###################################################

.PHONY: lib proj

all: lib proj
	$(SIZE) $(OUTPATH)/$(PROJ_NAME).elf
lib:
	$(MAKE) -C lib FLOAT_TYPE=$(FLOAT_TYPE)
	$(MAKE) -C helix FLOAT_TYPE=$(FLOAT_TYPE)
	$(MAKE) -C OffloadingFramework/remoteInitBoard FLOAT_TYPE=$(FLOAT_TYPE)

proj: 	$(OUTPATH)/$(PROJ_NAME).elf

$(OUTPATH)/$(PROJ_NAME).elf: $(SRCS) lib/startup_stm32f4xx.s
	$(CC) $(CFLAGS) -Tstm32_flash.ld $^ -o $@ $(LIBS)
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
	$(MAKE) clean -C OffloadingFramework/remoteInitBoard


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


#############################################################################################################################
#                                             Creating the init bin                                                        #
#############################################################################################################################
INIT_OUT = OffloadingFramework/remoteInitPC/bin
INIT_NAME = InitCode

init-bin: lib init-proj
	$(SIZE) $(INIT_OUT)/$(INIT_NAME).elf

init-proj: 	$(INIT_OUT)/$(INIT_NAME).elf

$(INIT_OUT)/$(INIT_NAME).elf: $(INIT_BIN_SRCS) #lib/startup_stm32f4xx.s
	$(CC) $(CFLAGS) -TOffloadingFramework/InitCode.ld $^ -o $@ $(LIBS)
	$(OBJCOPY) -O ihex $(INIT_OUT)/$(INIT_NAME).elf $(INIT_OUT)/$(INIT_NAME).hex
	$(OBJCOPY) -O binary $(INIT_OUT)/$(INIT_NAME).elf $(INIT_OUT)/$(INIT_NAME).bin

$(INIT_OUT)/%.bin: $(INIT_OUT)/%.elf | $(INIT_OUT)
	$(BIN) $< $@

init-clean:
	rm -f $(INIT_OUT)/*.bin
	rm -f $(INIT_OUT)/*.elf
	rm -f $(INIT_OUT)/*.hex
	rm -f $(INIT_OUT)/*.asm



