.data
src:    .asciz "hello world\0"   # Chaîne source
format: .asciz "%s"               # Format pour printf

.bss
    .lcomm dest, 50               # Création du tableau dest pour la copie

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

# Fonction principale main
main:
    xorl  %eax, %eax                 # Initialise %eax à zéro
    
    pushl   $src                      # Pousse l'adresse de la chaîne source (src) sur la pile
    pushl   $dest                     # Pousse l'adresse du tableau de destination (dest) sur la pile
    call    s_strcpy                 # Appelle la fonction s_strcpy pour copier la chaîne
    addl    $8, %esp                 # Nettoie la pile après l'appel de la fonction

    pushl   $dest                     # Pousse l'adresse du tableau de destination (dest) sur la pile
    pushl   $format                   # Pousse l'adresse du format sur la pile
    call    printf                   # Appelle la fonction printf pour afficher la chaîne copiée
    addl    $8, %esp                 # Nettoie la pile après l'appel de printf

    ret                               # Termine la fonction main
