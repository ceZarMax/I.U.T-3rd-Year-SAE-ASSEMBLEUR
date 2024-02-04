.data
src:    .asciz "world\0"   # Chaîne source
format: .asciz "%s\0"             # Format pour printf
dest:   .asciz "hello \0"

.text
.global main

# Fonction de concaténation de chaînes s_strncat
s_strncat:
    pushl   %ebp                   # Sauvegarde l'ancien pointeur de base de la pile
    movl    %esp,   %ebp           # Initialise un nouveau cadre de pile
    pushl   %esi                   # Sauvegarde le registre %esi
    pushl   %edi                   # Sauvegarde le registre %edi
    movl    16(%ebp), %ecx         # Récupère le paramètre 'n' (nombre de caractères à concaténer)
    movl    12(%ebp), %esi         # Récupère l'adresse de la chaîne source (src)
    movl    8(%ebp), %edi          # Récupère l'adresse du tableau de destination (dest)

# Trouver la fin de la chaîne de destination
find_end:
    cmpb    $0, (%edi)             # Compare le caractère actuel de la destination avec zéro
    je      copy_cat               # Si fin de chaîne, saute à copy_cat
    incl    %edi                   # Incrémente le pointeur destination
    jmp     find_end               # Saut à l'étiquette find_end pour répéter la boucle

# Copier la chaîne source à la fin de la chaîne destination
copy_cat:
    movl    %ecx, %eax             # Copie la valeur de 'n' dans %eax
    cmpl    $0, %eax               # Compare 'n' avec zéro
    je      end_strncat            # Si 'n' est égal à zéro, saute à la fin de strncat
    jmp     cp_strncat             # Sinon, saute à la copie limitée par 'n'

# Boucle de copie limitée par 'n'
cp_strncat:
    cmpb    $0, (%esi)             # Compare le caractère actuel de la source avec zéro (fin de chaîne)
    je      end_strncat            # Si fin de chaîne, saute à la fin de strncat
    movb    (%esi), %dl            # Copie le caractère actuel de la source dans %dl
    movb    %dl,    (%edi)         # Copie %dl à l'adresse de destination (%edi)
    incl    %esi                   # Incrémente le pointeur source
    incl    %edi                   # Incrémente le pointeur destination
    decl    %eax                   # Décrémente 'n'
    jg      cp_strncat             # Si 'n' est toujours supérieur à zéro, répète la boucle

# Fin de strncat
end_strncat:
    movb    $0, (%edi)              # Ajoute le caractère nul à la fin de la chaîne de destination
    popl    %edi                    # Restaure le registre %edi
    popl    %esi                    # Restaure le registre %esi
    popl    %ebp                    # Restaure l'ancien pointeur de base de la pile
    ret


# Fonction principale main
main:
    movl %esp, %ebp #for correct debugging
    xorl    %eax, %eax             # Initialise %eax à zéro

    pushl   $2                      # Pousse la valeur de 'n' sur la pile (par exemple, 2)
    pushl   $src                    # Pousse l'adresse de la chaîne source (src) sur la pile
    pushl   $dest                   # Pousse l'adresse du tableau de destination (dest) sur la pile
    call    s_strncat               # Appelle la fonction s_strncat pour concaténer les 'n' premiers caractères
    addl    $12, %esp               # Nettoie la pile après l'appel de la fonction

    pushl   $dest                   # Pousse l'adresse du tableau de destination (dest) sur la pile
    pushl   $format                 # Pousse l'adresse du format sur la pile
    call    printf                 # Appelle la fonction printf pour afficher la chaîne concaténée
    addl    $8, %esp                # Nettoie la pile après l'appel de printf

    ret                             # Termine la fonction main
