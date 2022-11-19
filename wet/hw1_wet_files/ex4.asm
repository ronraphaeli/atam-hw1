.global _start

.section .text
_start:
	mov $new_node, %rbx # get addr of value of new_node
    mov (%rbx), %rcx # get value of new_node
    mov $root, %rax
    mov root, %rax # get addr of value of root
	test %rax , %rax    # check head isn't NULL
    je head_null_hw1
    mov (%rax), %rdx # get value of root
    xor %r8, %r8 # zero constant
    
.Loop1_hw1:        
    cmpq %rcx, %rdx
    jg greater_hw1
    jl lesser_hw1
    je exit_hw1
    
    

greater_hw1:    
    mov 8(%rax), %r9 # get addr of left son
    cmp %r8, %r9
    je add_left_son_hw1
    mov 8(%rax), %rax
    mov (%rax), %rdx # get value of left son
    jmp .Loop1_hw1

lesser_hw1:
    mov 16(%rax), %r9 # get addr of right son
    cmp %r8, %r9
    je add_right_son_hw1
    mov 16(%rax), %rax
    mov (%rax), %rdx # get value of right son    
    jmp .Loop1_hw1
    
add_right_son_hw1:
    mov %rbx, 16(%rax, %r8)
    jmp exit_hw1
    
add_left_son_hw1:
    mov %rbx, 8(%rax, %r8)
    jmp exit_hw1

head_null_hw1:
    mov %rbx, root(%rip)
	
exit_hw1:
	nop
