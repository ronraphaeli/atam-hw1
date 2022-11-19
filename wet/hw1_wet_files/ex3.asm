.global _start

.section .text
_start:
    mov $0, %rdx
    mov $0, %rax #e
    mov $0 , %r8 
    mov $array1, %r9 
    mov $array2, %r10 
    mov $mergedArray, %r11
    
.Loop1_hw1:
    lea -4(%r8, %r11), %r13
    movl (%r13), %r13d
    
    movl (%r9, %rdx), %ebx
    movl (%r10, %rax), %ecx
    cmpl %ecx, %ebx 
    ja greater_hw1
    jb lesser_hw1
    je equal_hw1

greater_hw1:
    movl -4(%r11, %r8), %r12d
    cmpl %r12d,%ebx 
    je not_equal_and_exist_greater_hw1
    movl %ebx, (%r8,%r11,1)    
    add $4,%rdx
    add $4,%r8
    jmp .Loop1_hw1

lesser_hw1:
    movl -4(%r11, %r8), %r12d
    cmpl %r12d,%ecx 
    je not_equal_and_exist_lesser_hw1
    movl %ecx, (%r8,%r11,1) 
    add $4,%rax
    add $4,%r8
    jmp .Loop1_hw1

equal_hw1:
    cmpl $0,%ebx
    je ending_hw1
    
    movl -4(%r11, %r8), %r12d
    cmpl %r12d,%ebx
    je equal_and_exist_hw1
    jne equal_and_not_exist_hw1
    
not_equal_and_exist_greater_hw1:
    add $4,%rdx
    jmp .Loop1_hw1    
    
not_equal_and_exist_lesser_hw1:
    add $4,%rax
    jmp .Loop1_hw1

equal_and_exist_hw1:
    add $4,%rax
    add $4,%rdx
    jmp .Loop1_hw1

equal_and_not_exist_hw1:
    movl %ecx, (%r8,%r11,1)    
    add $4,%rdx
    add $4,%r8
    jmp .Loop1_hw1 
    
ending_hw1:
    movl $0 , (%r11, %r8)

    

