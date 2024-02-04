.data
str: .asciz "le résultat est %d\n"

.text

.global power
# Input: %edi = base, %esi = exponent
# Output: %eax = result
power:
    # Special case for negative exponents
    test    %esi, %esi
    js      negate_exponent

    # Initialize the result to 1
    movl    $1, %eax

    # Loop while the exponent is greater than 0
    cmp     $0, %esi
    jle     done
loop:
    imul    %edi, %eax
    dec     %esi
    jne     loop
done:
    ret

negate_exponent:
    negl    %esi
    call    power
    cdq                        
    xchg    %eax, %edx           
    movl    $1, %eax            
    xorps   %xmm0, %xmm0         
    divsd   %xmm0, %xmm0        
    fwait                       
    ret

.global main
main:
    push    %ebp
    mov     %esp, %ebp

    
    movl    $2, %edi
    movl    $3, %esi
    call    power

    
    pushl   %eax
    pushl   $str
    call    printf
    addl    $16, %esp

    mov     %ebp, %esp
    pop     %ebp
    ret