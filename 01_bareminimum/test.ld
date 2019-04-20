SECTIONS
{
    /* RPi2: 0x8000, RPi3: 0x80000 */
    . = 0x8000;
    .text : { *(.text.boot) }

   /DISCARD/ : { *(.comment) *(.gnu*) *(.note*) *(.eh_frame*) }
}
