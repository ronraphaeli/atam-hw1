.global _start

.section .text
_start:
    xor %rax, %rax
    movl num, %eax
    cdq
    movl $0,%ecx    
    cmp %ecx,%edx
    je possitive_hw1
    jne negative_hw1
    
possitive_hw1:
    xor %rbx, %rbx
    mov $source, %rdx
    mov $destination, %r8 
.Loop1_hw1:
    movb (%rdx,%rbx), %cl
    movb %cl, (%r8,%rbx,1)
    lea (%r8,%rbx,1), %rcx
    mov (%rcx), %rcx
    
    inc %rbx
    dec %eax
    test %eax, %eax
    jne .Loop1_hw1
    
    jmp end_hw1

negative_hw1:
    imul $-1, %eax
    xor %rbx, %rbx

    mov $source, %rdx
    mov $destination, %r8 
.Loop2_hw1:
    movb (%rdx,%rbx), %cl
    movb %cl, -1(%r8,%rax,1)
    
    inc %rbx 
    dec %eax 
    test %eax, %eax
    jne .Loop2_hw1
    
end_hw1:
