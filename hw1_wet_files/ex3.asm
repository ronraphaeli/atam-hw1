.global _start

.section .text
_start:
    mov $0, %rdx ;in charge of array1
    mov $0, %rax ;in charge of array2
    mov $0 , %r8 ;in charge of merge
    cmpl %rdx(array1) , %rax(array2)
    jg greater
    jl lesser
    je equal



greater:
    movl %rdx(array1) , %r8(mergedArray)
    add $4,%rdx
    add $4,%r8
    jmp _start

lesser:
    movl %rax(array2) , %r8(mergedArray)
    add $4,%rax
    add $4,%r8
    jmp _start

equal:
    cmpl $0,%rdx(array1)
    je ending
    add $4,%rax
    add $4,%rdx
    jmp _start

ending:
    movl $0 , %r8(mergedArray)


    
