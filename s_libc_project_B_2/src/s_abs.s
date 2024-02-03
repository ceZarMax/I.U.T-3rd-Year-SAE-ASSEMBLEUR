.data
str: .asciz "La valeur de eax en val absolu = %d \n"


.text

abs:
    push    %ebp
    movl    %esp,   %ebp
    movl    8(%ebp), %eax
    cmpl    $0, %eax
    jg      positif
    neg     %eax
positif:    
    popl    %ebp
    ret

.global main
main:
    pushl   %ebp
    movl    %esp, %ebp
    
    pushl   $-54
    call    abs
    addl    $4, %esp
    
    pushl   %eax
    pushl   $str
    call    printf
    addl    $8, %esp
    
    popl    %ebp
    ret