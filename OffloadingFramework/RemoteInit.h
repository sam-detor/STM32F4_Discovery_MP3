/**
 * @file RemoteInit.h
 * @author Sam Detor (sam.detor@yale.edu)
 * @brief This file holds all of the user defined constants for the offloading framework. See the framework Readme for more details.
 * @version 0.1
 * @date 2023-08-04
 * 
 * @copyright Copyright (c) 2023
 * 
 */

//Board Constants
#define RAM_SIZE 0x20000
#define RAM_START 0x20000000
#define RAM_STACK_SIZE 0x400
#define WORD_SIZE 4

//PC constants
#define BAUD_RATE 460800//230400
#define DEVICE_FILE "/dev/cu.YECL_BLE_MOD"

//Both
#define COMMS_TIMEOUT 1000
