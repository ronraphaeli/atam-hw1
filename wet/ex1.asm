.global _start

.section .text
_start:
    movq num, %rax
    sal $6,%al    
    movb $0,%dl
    cmp %al,%dl
    je equal_hw1
    jne nequal_hw1

equal_hw1:
    movb $1,Bool
	jmp end_hw1

nequal_hw1:
    movb $0,Bool

end_hw1:
    
