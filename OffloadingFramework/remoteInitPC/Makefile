BUILD_DIR = build
CC=$ gcc
CFLAGS=-std=c11 -Wall -pedantic -g3 -I. -Iinc
SRCS = main.c SendData.c PortMethods.c PacketHandling.c RecieveData.c
BUILD_DIR = build

OBJS = $(SRCS:%.c=$(BUILD_DIR)/%.o)

.PHONY: all
all: RemoteInitPC run

build/%.o : src/%.c
	$(CC) -c -o $@ $< $(CFLAGS)

.PHONY: RemoteInitPC
RemoteInitPC: $(OBJS)
	$(CC) -o $(BUILD_DIR)/$@ $^ $(CFLAGS)

run:
	$(BUILD_DIR)/remoteInitPC

clean:
	rm -f $(OBJS) $(BUILD_DIR)/RemoteInitPC