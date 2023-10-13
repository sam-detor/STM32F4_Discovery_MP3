BUILD_DIR = build
CC=$ arm-none-eabi-gcc
AR=$ arm-none-eabi-ar

###################################################

# Check for valid float argument
ifneq ($(FLOAT_TYPE), hard)
ifneq ($(FLOAT_TYPE), soft)
override FLOAT_TYPE = hard
#override FLOAT_TYPE = soft
endif
endif

###################################################

ifeq ($(FLOAT_TYPE), hard)
CFLAGS += -fsingle-precision-constant -Wdouble-promotion
CFLAGS += -mfpu=fpv4-sp-d16 -mfloat-abi=hard
#CFLAGS += -mfpu=fpv4-sp-d16 -mfloat-abi=softfp
else
CFLAGS += -msoft-float
endif

vpath %.c src

CFLAGS  = -std=gnu99 -g -Os -Wall
CFLAGS += -mlittle-endian -mthumb -mthumb-interwork -mcpu=cortex-m4

ifeq ($(FLOAT_TYPE), hard)
CFLAGS += -fsingle-precision-constant -Wdouble-promotion
CFLAGS += -mfpu=fpv4-sp-d16 -mfloat-abi=hard
#CFLAGS += -mfpu=fpv4-sp-d16 -mfloat-abi=softfp
else
CFLAGS += -msoft-float
endif

CFLAGS += -ffreestanding -nostdlib
CFLAGS += -Iinc -Iinc/core

#SRCS  = stm32f4_discovery.c
SRCS = stm32f4xx_usart.c HALReplacements.c RecieveDataNew.c RemoteInitBoard.c

OBJS = $(SRCS:%.c=$(BUILD_DIR)/%.o)

.PHONY: libremoteInitBoard.a

all: libremoteInitBoard.a

build/%.o : %.c
	$(CC) $(CFLAGS) -c -o $@ $^

libremoteInitBoard.a: $(OBJS)
	$(AR) -r $(BUILD_DIR)/$@ $(OBJS)

clean:
	rm -f $(OBJS) $(BUILD_DIR)/libremoteInitBoard.a