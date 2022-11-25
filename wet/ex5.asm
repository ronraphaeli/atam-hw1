.global _start

.section .text
_start:

#rcx = will be a counter for times of val
#r8 pointer to pointer of first node with data=val
#r9 pointer to pointer of second node with data=val
#r10 pointer to pointer of current node
#r11 pointer to current node
#r12 = val

    xor %rcx, %rcx #rcx=0
    movq $head , %r10
    movq (head) , %r11
    movl (val) , %r12d
    
propagate_HW1:
    movq (%r11), %r14
    cmpl %r12d , (%r11)
    je found_val_HW1
    cmpq $0 ,8(%r11) #compare node->next with 0 to check if null
    je end_list_HW1
    
move_node_HW1:
    movq %r11 , %r10
    addq $8 , %r10
    movq (%r10) , %r11
    jmp propagate_HW1
    
found_val_HW1:
    inc %rcx
    cmpq $2 , %rcx #counter-2
    jg end_HW1 
    je second_val_HW1
    movq %r10 , %r8
    cmpq $0 ,8(%r11) #compare node->next with 0 to check if null
    je end_list_HW1
    jmp move_node_HW1
    
second_val_HW1:
    movq %r10 , %r9
    cmpq $0 ,8(%r11) #compare node->next with 0 to check if null
    je end_list_HW1
    jmp move_node_HW1
    
end_list_sequnce_HW1:
    movq %rax , 8(%r13) #node1.next = rax = node2.next
    movq %r13 , 8(%r14) #node2.next = rdx = node1.next
        
    movq %r14 , (%r8)
    nop
    jmp end_HW1
    
end_list_HW1:
    cmpq $2 , %rcx #counter-2
    jne end_HW1
    nop
    movq (%r8) ,%r13 #r13 = pointer to node1
    movq 8(%r13) , %rdx #rdx = node1.next
    movq (%r9) ,%r14 #r14 = pointer to node2
    movq 8(%r14) , %rax #rax = node2.next
    cmpq %rdx, %r14
    je end_list_sequnce_HW1
    movq %rax , 8(%r13) #node1.next = rax = node2.next
    movq %rdx , 8(%r14) #node2.next = rdx = node1.next
    nop
    movq (%r8) , %rdx
    movq (%r9) , %rax
    movq %rdx , (%r9)
    movq %rax , (%r8)
    nop

end_HW1:
