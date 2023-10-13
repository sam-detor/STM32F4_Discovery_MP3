BUILD_DIR = build
CC=$ gcc
CFLAGS=-std=c11 -std=c99 -Wall -pedantic -g3 -I. -Iinc
SRCS = main.c SendData.c PortMethods.c PacketHandling.c RecieveData.c
BUILD_DIR = build

OBJS = $(SRCS:%.c=$(BUILD_DIR)/%.o)

.PHONY: all
all: build run

build/%.o : src/%.c
	$(CC) -c -o $@ $< $(CFLAGS)

.PHONY: build
build: $(OBJS)
	$(CC) -o $(BUILD_DIR)/RemoteInitPC $^ $(CFLAGS)

run:
	$(BUILD_DIR)/RemoteInitPC

.PHONY: remoteInitPC
remoteInitPC: build run

clean:
	rm -f $(OBJS) $(BUILD_DIR)/RemoteInitPC