/* Entry Point */
ENTRY(Reset_Handler)

/* Specify the memory areas */
MEMORY
{
  FLASH (rx)      : ORIGIN = 0x08000000, LENGTH = 1024K
  RAM (rwx)       : ORIGIN = {RAM_CODE_START}, LENGTH = 128K
  CCM (rwx)       : ORIGIN = 0x10000000, LENGTH = 64K
}

/* Define output sections */
SECTIONS
{
  /* The program code and other data goes into RAM */
 
  .text :
  {
    . = ALIGN(4);
    *(.text*)
    *(.text)           /* .text sections (code) */
                       /* .text* sections (code) */
  
    _etext = .;        /* define a global symbols at end of code */
    _exit = .;
  } >RAM
}
