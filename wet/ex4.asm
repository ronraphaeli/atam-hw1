.global _start

.section .text

_start:

# r9 = will hold the addres to next node (when needed)
# r10 = addres of current node
# r11 =addres of new node
# r12 = data of new node
# r13 = current node data


    xor %rax , %rax #rax=0
    movq $root , %r9 
    movq (root) , %r10
    movq (new_node) , %r12
    movq $new_node , %r11
    cmpq $0 , %r10 # is the root empty?
    je empty_tree_HW1
    
    
loop_HW1:
    movq (%r10) , %r13 # current node data -> r13 
    cmp  %r13 , %r12  # new-current
    je end_HW1 #same node so do nothing
    jg greater_HW1 #go to right side
    jl lesser_HW1 #go to left side
    
greater_HW1:
    movq %r10 , %r9
    addq $16 , %r9 
    cmpq %rax , (%r9) #is the right side empty?
    je insert_HW1 #if yes, insert the node
    movq (%r9) , %r10 #if not, the right node is the new current
    jmp loop_HW1    
    
lesser_HW1:
    movq %r10 , %r9
    addq $8 , %r9
    cmpq %rax , (%r9) #is the left side empty?
    je insert_HW1 #if yes, insert the node
    movq (%r9) , %r10 #if not, the left node is the new current
    jmp loop_HW1    
    
    
insert_HW1:
    movq %r11 ,(%r9) #insert the addres of new node to the empty place
    jmp end_HW1     
    
empty_tree_HW1:
    movq %r11 , (root)
    jmp end_HW1 
    
end_HW1:
    