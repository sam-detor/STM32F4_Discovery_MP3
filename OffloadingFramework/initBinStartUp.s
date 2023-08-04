/**
* This start up script is used when generating the offloaded code binary (InitCode.bin). Since it is compiled with flags that make
* sure all unused functions are not included in the final binary, this makes sure that the only method offloadedCode and all the 
* methods it calls are included in the final offloaded binary
*/
  .syntax unified
  .cpu cortex-m3
  .fpu softvfp
  .thumb

/**
 * @brief  This is the code that gets called when the processor first
 *          starts execution following a reset event.
 * @param  None
 * @retval : None
*/
.word  _edata
/* end address for the .bss section. defined in linker script */
.word  _ebss

    .section  .text.Reset_Handler
  .weak  Reset_Handler
  .type  Reset_Handler, %function
Reset_Handler:
/* Call the application's entry point.*/
  bl  offloadedCode
  bx  lr
.size  Reset_Handler, .-Reset_Handler