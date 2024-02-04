.data
src:    .asciz "world\0"   # Chaîne source
format: .asciz "%s\0"             # Format pour printf
dest:   .asciz "hello \0"

.text
.global main

# Fonction de copie de chaîne s_strcpy
s_strcpy:
    pushl   %ebp                   # Sauvegarde l'ancien pointeur de base de la pile
    movl    %esp,   %ebp           # Initialise un nouveau cadre de pile
    pushl   %esi                   # Sauvegarde le registre %esi
    pushl   %edi                   # Sauvegarde le registre %edi
    movl    12(%ebp), %esi         # Récupère l'adresse de la chaîne source (src)
    movl    8(%ebp), %edi          # Récupère l'adresse du tableau de destination (dest)
    movl    %edi,    %eax           # Copie l'adresse de dest dans %eax

# Boucle de copie
cp:
    cmpb    $0, (%esi)             # Compare le caractère actuel de la source avec zéro (fin de chaîne)
    je      fincp                   # Si fin de chaîne, saute à fincp
    movb    (%esi), %dl            # Copie le caractère actuel de la source dans %dl
    movb    %dl,    (%edi)         # Copie %dl à l'adresse de destination (%edi)
    incl    %esi                   # Incrémente le pointeur source
    incl    %edi                   # Incrémente le pointeur destination
    jmp     cp                     # Saut à l'étiquette cp pour répéter la boucle

# Fin de la fonction
fincp:
    movb    $0, (%edi)              # Ajoute le caractère nul à la fin de la chaîne de destination
    popl    %edi                    # Restaure le registre %edi
    popl    %esi                    # Restaure le registre %esi
    popl    %ebp                    # Restaure l'ancien pointeur de base de la pile
    ret

# Fonction de concaténation de chaînes s_strcat
s_strcat:
    pushl   %ebp                   # Sauvegarde l'ancien pointeur de base de la pile
    movl    %esp,   %ebp           # Initialise un nouveau cadre de pile
    pushl   %esi                   # Sauvegarde le registre %esi
    pushl   %edi                   # Sauvegarde le registre %edi
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
    jmp     cp                     # Saut à l'étiquette cp (fonction de copie)

# Fonction principale main
main:
    xorl    %eax, %eax             # Initialise %eax à zéro

    pushl   $src                    # Pousse l'adresse de la chaîne source (src) sur la pile
    pushl   $dest                   # Pousse l'adresse du tableau de destination (dest) sur la pile
    call    s_strcat               # Appelle la fonction s_strcat pour concaténer les chaînes
    addl    $8, %esp               # Nettoie la pile après l'appel de la fonction

    pushl   $dest                   # Pousse l'adresse du tableau de destination (dest) sur la pile
    pushl   $format                 # Pousse l'adresse du format sur la pile
    call    printf                 # Appelle la fonction printf pour afficher la chaîne concaténée
    addl    $8, %esp               # Nettoie la pile après l'appel de printf

    ret                             # Termine la fonction main
