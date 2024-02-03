.data
src:    .asciz "hello world\0"   # Chaîne source
format: .asciz "%s"               # Format pour printf

.bss
    .lcomm dest, 50               # Création du tableau dest pour la copie

.text
.global main

# Fonction de copie de chaîne s_strncpy
s_strncpy:
    pushl   %ebp                   # Sauvegarde l'ancien pointeur de base de la pile
    movl    %esp,   %ebp           # Initialise un nouveau cadre de pile
    pushl   %esi                   # Sauvegarde le registre %esi
    pushl   %edi                   # Sauvegarde le registre %edi
    movl    16(%ebp), %ecx          # Récupère n caractères à copier
    movl    12(%ebp), %esi         # Récupère l'adresse de la chaîne source (src)
    movl    8(%ebp), %edi          # Récupère l'adresse du tableau de destination (dest)
    movl    %edi,    %eax           # Copie l'adresse de dest dans %eax

# Boucle de copie
cpstrn:
    cmpb    $0, (%esi)             # Compare le caractère actuel de la source avec zéro (fin de chaîne)
    je      fincpstrn                   # Si fin de chaîne, saute à fincp
    cmp     $0, %ecx
    je      fincpstrn                   # Si 'n' atteint zéro, saute à fincp
    movb    (%esi), %dl            # Copie le caractère actuel de la source dans %dl
    movb    %dl,    (%edi)         # Copie %dl à l'adresse de destination (%edi)
    incl    %esi                   # Incrémente le pointeur source
    incl    %edi                   # Incrémente le pointeur destination
    dec     %ecx                   # Décrémente 'n'
    jmp     cpstrn                     # Saut à l'étiquette cp pour répéter la boucle

# Fin de la fonction
fincpstrn:
    movb    $0, (%edi)              # Ajoute le caractère nul à la fin de la chaîne de destination
    popl    %edi                    # Restaure le registre %edi
    popl    %esi                    # Restaure le registre %esi
    popl    %ebp                    # Restaure l'ancien pointeur de base de la pile
    ret

# Fonction principale main
main:
    movl %esp, %ebp                 # Sauvegarde l'ancien pointeur de base de la pile pour un débogage correct
    xorl  %eax, %eax                 # Initialise %eax à zéro
    
    pushl   $5                      # Pousse la valeur '5' (limite de caractères à copier) sur la pile
    pushl   $src                    # Pousse l'adresse de la chaîne source (src) sur la pile
    pushl   $dest                   # Pousse l'adresse du tableau de destination (dest) sur la pile
    
    call    s_strncpy               # Appelle la fonction s_strncpy pour copier la chaîne avec limite
    addl    $12, %esp               # Nettoie la pile après l'appel de la fonction

    pushl   $dest                   # Pousse l'adresse du tableau de destination (dest) sur la pile
    pushl   $format                 # Pousse l'adresse du format sur la pile
    call    printf                 # Appelle la fonction printf pour afficher la chaîne copiée
    addl    $8, %esp                # Nettoie la pile après l'appel de printf

    ret                             # Termine la fonction main
