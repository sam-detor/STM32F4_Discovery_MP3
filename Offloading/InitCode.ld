/* Entry Point */
ENTRY(Reset_Handler)

/* Highest address of the user mode stack */
/*_estack = 0x20001770;  */  /* end of 128K RAM on AHB bus*/

/* Generate a link error if heap and stack don't fit into RAM */
/*_Min_Heap_Size = 0;       required amount of heap  */
/*_Min_Stack_Size = 0x400; /* required amount of stack */

/* Specify the memory areas */
MEMORY
{
  FLASH (rx)      : ORIGIN = 0x08000000, LENGTH = 1024K
  RAM (rwx)       : ORIGIN = 0x20009da4, LENGTH = 10000K /*128K*/
  CCM (rwx)       : ORIGIN = 0x10000000, LENGTH = 64K
}

/* Define output sections */
SECTIONS
{
    /* The program code and other data goes into RAM */
  .text :
  {
    . = ALIGN(4);
    _etext_start = .;
    *(.text*)
    *(.text)           /* .text sections (code) */
                       /* .text* sections (code) */
  
    _etext = .;        /* define a global symbols at end of code */
    _exit = .;
  } >RAM
}
