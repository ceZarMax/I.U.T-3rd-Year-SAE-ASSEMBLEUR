.text

.global init
init:
    ret

.global s_abs
s_abs:
    push %ebp
    movl %esp, %ebp
    movl 8(%ebp), %eax
    cmpl $0, %eax
    jg positif
    neg %eax
positif:
    popl %ebp
    ret
    
    
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
    

