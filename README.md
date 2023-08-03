# STM32F4_Discovery_MP3

This code is a modified version of code found [here](http://vedder.se/2012/07/play-mp3-on-the-stm32f4-discovery/), written by Benjamin. Hos code plays a short mp3 file stored in the MCU flash. This is an example of how to use the Offloading framework found in [this](https://github.com/sam-detor/OffloadingFramework) repository to offload the initialization code for Benjamin's music playing code.

## Set Up

This code uses the STM32F407 discovery kit and the HC-05 bluetooth module. 
The HC-05 module needs to be configured to run as follows: 
       baud rate: 460800
       word length: 8 bit
       parity: none
       name: YECL_BLE_MOD
This code uses UART4 on the STM32f407 discovery board to communicate with the bluetooth module, with PC10 as Tx and PC11 as Rx. Meaning PC10 and PC11 need to be connected to the Rx and Tx pin of the HC-05 module, respectively.
The code also requires that the HC-05 module be paired with the computer by the user, so be sure to do that before running the code.

## Running the code
Run 'make' and then 'make init-bin' in this dir to make the code and the offloaded binary. Then run 'make' in the remoteInitPC dir. Finally, run 'make flash' in this dir, and once the code is flashed, the music should play and the leds should flash. Press the blue button to adjust the volume.
