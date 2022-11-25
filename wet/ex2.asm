.section .text
.global _start
_start:
    xor %rax, %rax #rax will hold the temp values to move
    xor %rcx , %rcx #rcx will be the counter to know how many bites we moved from source
    xor %r10 , %r10 # will be 1 if num>=0 and -1 else
    xor %r12 , %r12 # like rcx but for destination
    
    leaq (destination) , %r13 #will hold dest address
    leaq (source) , %r11 #r11 = &source #will hold the address to start push from
    movsx (num) , %r9 # r9 will hold the label num
    
    cmp $0 , %r9 
    jge positive_num_HW1
    
    jmp negative_num_HW1
    
negative_num_HW1:
    neg %r9
    movq $-1 , %r10
    jmp load_into_stack_HW1
    
 positive_num_HW1:
    movq $1 , %r10
    leaq (destination) , %r13
    leaq (source) , %r11 #r11 = &source
    addq %r9 , %r13
    subq $1 , %r13 #r13 = dest + num -1
    jmp load_into_stack_HW1
 
    
load_into_stack_HW1:
    xor %rax , %rax
    cmpq %rcx , %r9
    jle calculate_good_values_in_upper_stack_frame_HW1
    push (%r11)
    addq $8 , %r11
    addq $8 , %rcx
    movq %rsp , %r15 #r15 will hold the add of current most upper stack frame
    jmp load_into_stack_HW1

calculate_good_values_in_upper_stack_frame_HW1:
    movq %r9 , %rax
    xor %rdx , %rdx
    movq $8 , %rbx
    idiv %rbx
    # checks the reminder of num/8 .
    test %rdx , %rdx
    jz perfect_match_HW1
    movq %rdx , %r14
    addq %r14 , %r15
    subq $1 , %r15
    jmp pop_out_HW1
    
perfect_match_HW1:
    movq $8 , %r14
    addq %r14 , %r15
    subq $1 , %r15
    jmp pop_out_HW1
    
pop_out_HW1:
    
    cmpq %r12 , %r9
    je end_HW1
    cmpq $0 , %r14
    jz load_from_stack_HW1
    
    movb (%r15) , %al
    movb %al , (%r13)
    dec %r15
    subq %r10 , %r13
    dec %r14
    inc %r12
    jmp pop_out_HW1
    

load_from_stack_HW1:
    pop %rax
    movq %rsp , %r15
    movq $8 , %r14
    addq $7 ,%r15
    jmp pop_out_HW1
    
end_HW1:
    pop %rax
