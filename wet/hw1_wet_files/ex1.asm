.global _start

.section .text
_start:
    movb num, %Al
    sall $6,%al
    mobb %0,%dl
    cmp %al,%dl
    je equal
    jne nequal

equal:
    mov $1,bool

nequal:
    mov $0,bool




