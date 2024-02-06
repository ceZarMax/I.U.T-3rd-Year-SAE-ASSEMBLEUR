.section .text_s_stdio
.global init_s_stdio

.section .text
.global s_puts

s_puts:
    # Sauvegarde de l'état initial de la pile
    pushl %ebp
    movl %esp, %ebp
    
    # Initialisation des registres
    movl 8(%ebp), %ecx   # Adresse de la chaîne à afficher
    
    # Boucle de l'affichage des caractères
print_loop:
    movzbl (%ecx), %eax  # Chargement du caractère dans %eax (zéro-extensión)
    test %al, %al        # Test si le caractère est nul (fin de la chaîne)
    jz end_print_loop    # Si nul, fin de la boucle
    
    # Appel système pour afficher le caractère
    movl $4, %eax
    movl $1, %ebx
    movl %ecx, %edx
    movl $1, %edx
    int $0x80
    
    incl %ecx            # Déplacement vers le caractère suivant
    jmp print_loop       # Saut vers le début de la boucle

# Fin de la boucle et nettoyage de la pile
end_print_loop:
    pop %ebp
    ret

init_s_stdio:
    ret
