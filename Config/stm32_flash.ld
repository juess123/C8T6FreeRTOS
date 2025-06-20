MEMORY
{
    flash (rx) : ORIGIN = 0x08000000, LENGTH = 64K
    ram  (rwx) : ORIGIN = 0x20000000, LENGTH = 20K
}
_estack = ORIGIN(ram) + LENGTH(ram);
ENTRY(Reset_Handler)
_heap_size = 0;    
_stack_size = 0; 
SECTIONS
{
    .isr_vector :
    {
        __isr_vector_start__ = .;
        KEEP(*(.isr_vector))
        ASSERT(. != __isr_vector_start__, "The .isr_vector section is empty");
    }>flash
    .text :
    {
        . = ALIGN(4);
        _stext = . ;
        KEEP(*(.init))
        KEEP(*(.fini))
        . = ALIGN(4);
        _etext = .;
    }>flash
    .ARM.extab : 
    {
        *(.ARM.extab*)
    } >flash
    .ARM.exidx : 
    {
        *(.ARM.exidx*)
    } >flash
    _sidata = .;
    .data : AT(_sidata) /* LMA address is _sidata (in FLASH) */
    {
        . = ALIGN(4);
        _sdata = .; /* data section VMA address */
        *(.data*)
        . = ALIGN(4);
        _edata = .;
    } >ram

    .bss :
    {
        . = ALIGN(4);
        _sbss = .;
        *(.bss*)
        *(COMMON)
        . = ALIGN(4);
        _ebss = .;
    } >ram

     ._heap :
    {
        . = ALIGN(4);
        . = . + _heap_size;
        . = ALIGN(4);
    } >ram
    ._stack :
    {
        . = ALIGN(4);
        . = . + _stack_size;
        . = ALIGN(4);
    } >ram
}
__isr_vector_size__ = SIZEOF(.isr_vector);
__text_size__ = SIZEOF(.text);
__data_size__ = SIZEOF(.data);
__bss_size__ = SIZEOF(.bss);
