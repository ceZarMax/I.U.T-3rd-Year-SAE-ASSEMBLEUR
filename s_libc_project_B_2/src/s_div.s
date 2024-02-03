.data
str: .asciz "Le résultat de la division est : %d\n"

.text

.global div
div:
    push    %ebp
    movl    %esp, %ebp
    movl    8(%ebp), %eax       # Chargement du dividende dans %eax
    movl    12(%ebp), %ebx      # Chargement du diviseur dans %ebx

    # Gestion de la division par zéro
    test    %ebx, %ebx
    jz      division_by_zero

    # Réaliser la division
    xor     %edx, %edx          # Effacer %edx pour le quotient
    idiv    %ebx                # Division de %eax par %ebx, quotient dans %eax, reste dans %edx

    jmp     end_div

division_by_zero:
    movl    $-1, %eax           # Mettre une valeur spéciale en cas de division par zéro

end_div:
    pop     %ebp
    ret

.global main
main:
    push    %ebp
    mov     %esp, %ebp

    pushl   $7                # Diviseur
    pushl   $70                # Dividende
    call    div
    addl    $8, %esp

    pushl   %eax
    pushl   $str
    call    printf
    addl    $8, %esp

    mov     %ebp, %esp
    pop     %ebp
    ret