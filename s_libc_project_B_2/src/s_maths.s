.text



.global init



init:

    ret



######################################

######### Fonction s_abs ##########

######################################

.global s_abs

s_abs:
    push    %ebp
    movl    %esp,   %ebp
    movl    8(%ebp), %eax
    cmpl    $0, %eax
    jg      positif
    neg     %eax
positif:    
    popl    %ebp
    ret

# Fin de sabs
finish_sabs:
    popl    %edi                 # Restaure le registre %edi
    popl    %esi                 # Restaure le registre %esi
    popl    %ebp                 # Restaure l'ancien pointeur de base de la pile
    ret



######################################

######### Fonction s_div ##########

######################################

.data

.text

.global div

div:
    test    %esi, %esi
    jz      division_par_zero
    xor     %edx, %edx
    mov     %edi, %eax
    idiv    %esi
    mov     %edx, %eax       
    ret                      

division_par_zero:
    movl    $-1, %eax
    xor     %edx, %edx
    ret
 
 finish_sdiv:
    popl    %edi                 # Restaure le registre %edi
    popl    %esi                 # Restaure le registre %esi
    popl    %ebp                 # Restaure l'ancien pointeur de base de la pile
    ret
    
 
######################################

######### Fonction s_pow ##########

######################################

.text
.global power

power:
    push    %ebp
    mov     %esp, %ebp
    sub     $8, %esp   

    movl    8(%ebp), %edx  
    movl    12(%ebp), %ecx

    movl    $1, %eax   

    loop_start:
        imul    %edx, %eax   
        decl    %ecx         
        jg      loop_start   

    movl    %eax, -4(%ebp)   

    leave               
    ret

finish_spow:
    popl    %edi                 
    popl    %esi                
    popl    %ebp         
    ret