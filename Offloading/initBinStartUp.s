  .syntax unified
  .cpu cortex-m3
  .fpu softvfp
  .thumb

/**
 * @brief  This is the code that gets called when the processor first
 *          starts execution following a reset event. Only the absolutely
 *          necessary set is performed, after which the application
 *          supplied main() routine is called.
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