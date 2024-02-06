.section .text_s_stdlib
.global init_s_stdlib

.text

.section .text
.global s_abs2
s_abs2:
    push %ebp
    movl %esp, %ebp
    movl 8(%ebp), %eax
    cmpl $0, %eax
    jg positif2
    neg %eax
positif2:
    popl %ebp
    ret
    
    
.text

.section .text
.global s_atoi
s_atoi:
    push %ebp
    mov %esp, %ebp
    sub $4, %esp           

    mov 8(%ebp), %edi      
    mov $0, %eax           

atoi_loop:
    movzbl (%edi), %ecx    
    test %cl, %cl          
    je end_atoi            
    sub $'0', %cl         
    imul $10, %eax, %eax   
    add %ecx, %eax         
    inc %edi               
    jmp atoi_loop         

end_atoi:
    add $4, %esp           
    pop %ebp
    ret
    
init_s_stdlib:
    ret
