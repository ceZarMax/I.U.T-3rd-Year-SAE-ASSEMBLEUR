.section .text_s_maths
.global init_s_maths


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





.global s_div

s_div:
    pushl %ebp
    movl %esp, %ebp
    pushl %ebx             # Sauvegarder %ebx
    movl 8(%ebp), %eax     # Dividende
    movl 12(%ebp), %ebx    # Diviseur

    testl %ebx, %ebx       # Vérifier si le diviseur est 0
    jz div_by_zero         # Sauter à div_by_zero si c'est le cas

    xorl %edx, %edx        # Mettre %edx à 0 pour la division
    idivl %ebx             # Effectuer la division entière
    jmp end_s_div          # Sauter à la fin

div_by_zero:
    movl $-1, %eax         # Retourner -1 en cas de division par zéro

end_s_div:
    popl %ebx              # Restaurer %ebx
    popl %ebp
    ret
    


.global s_pow

s_pow:

    push %ebp

    mov %esp, %ebp

    sub $8, %esp



    movl 8(%ebp), %edx

    movl 12(%ebp), %ecx



    movl $1, %eax



    loop_start:

        imul %edx, %eax

        decl %ecx

        jg loop_start



    movl %eax, -4(%ebp)



    leave

    ret

init_s_maths:
    ret