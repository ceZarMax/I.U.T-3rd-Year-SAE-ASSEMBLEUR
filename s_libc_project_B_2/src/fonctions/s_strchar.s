.data
str:    .asciz "hello world\0"   # Chaîne de caractères
format: .asciz "%s\0"             # Format pour printf

.text
.global main

# Fonction de recherche de caractère s_strchr
s_strchr:
    pushl   %ebp                   # Sauvegarde l'ancien pointeur de base de la pile
    movl    %esp, %ebp             # Initialise un nouveau cadre de pile
    pushl   %esi                   # Sauvegarde le registre %esi
    movl    12(%ebp), %esi         # Récupère l'adresse de la chaîne de caractères (str)
    movl    8(%ebp), %ecx          # Récupère le caractère à rechercher (search_char)

# Boucle de recherche
search:
    movb    (%esi), %al            # Charge le caractère actuel de la chaîne dans %al
    cmpb    $0, %al                # Compare le caractère actuel avec zéro (fin de chaîne)
    je      not_found            # Si fin de chaîne, saute à not_found
    cmpb    %cl, %al               # Compare le caractère actuel avec le caractère à rechercher
    je      found                  # Si égal, saute à found
    incl    %esi                   # Incrémente le pointeur de la chaîne
    jmp     search                 # Saut à l'étiquette search pour répéter la boucle

# Cas où le caractère est trouvé
found:
    movl    %esi, %eax             # Charge l'adresse du caractère trouvé dans %eax
    jmp     finish_strchr          # Saut à finish_strchr

# Cas où le caractère n'est pas trouvé
not_found:
    movl    $0, %eax                # Charge zéro dans %eax (caractère non trouvé)

# Fin de strchr
finish_strchr:
    popl    %esi                   # Restaure le registre %esi
    popl    %ebp                   # Restaure l'ancien pointeur de base de la pile
    ret

# Fonction principale main
main:
    movl %esp, %ebp #for correct debugging
    xorl    %eax, %eax             # Initialise %eax à zéro

    pushl   $str                   # Pousse le caractère à rechercher (search_char) sur la pile
    pushl   $'o'                   # Pousse l'adresse de la chaîne de caractères (str) sur la pile
    call    s_strchr               # Appelle la fonction s_strchr pour rechercher le caractère
    addl    $8, %esp               # Nettoie la pile après l'appel de la fonction

    pushl   %eax                   # Pousse le résultat (adresse du caractère ou 0) sur la pile
    pushl   $format                # Pousse l'adresse du format sur la pile
    call    printf                 # Appelle la fonction printf pour afficher le résultat
    addl    $8, %esp               # Nettoie la pile après l'appel de printf

    ret                             # Termine la fonction main
