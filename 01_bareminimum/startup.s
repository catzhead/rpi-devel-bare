.section ".text.boot"

.global _start

_start:
1:  wfe         @ wait for exception
    b       1b  @ branch to label 1
