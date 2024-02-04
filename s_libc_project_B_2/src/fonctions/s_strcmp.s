.data
str1:   .asciz "world\0"  # Première chaîne
str2:   .asciz "world\0"  # Deuxième chaîne
format: .asciz "%d\0"      # Format pour printf

.text
.global main

# Fonction de comparaison de chaînes s_strcmp
s_strcmp:
    pushl   %ebp                 # Sauvegarde l'ancien pointeur de base de la pile
    movl    %esp, %ebp           # Initialise un nouveau cadre de pile
    pushl   %esi                 # Sauvegarde le registre %esi
    pushl   %edi                 # Sauvegarde le registre %edi
    movl    8(%ebp), %esi        # Récupère l'adresse de la première chaîne (str1)
    movl    12(%ebp), %edi       # Récupère l'adresse de la deuxième chaîne (str2)

# Boucle de comparaison
compare:
    movb    (%esi), %al          # Charge le caractère de la première chaîne dans %al
    movb    (%edi), %dl          # Charge le caractère de la deuxième chaîne dans %dl
    cmpb    $0, %al              # Compare le caractère de la première chaîne avec zéro (fin de chaîne)
    je      end_compare          # Si fin de chaîne, saute à end_compare
    cmpb    %dl, %al             # Compare les caractères actuels des deux chaînes
    jne     not_equal            # Si les caractères ne sont pas égaux, saute à not_equal
    incl    %esi                 # Incrémente le pointeur de la première chaîne
    incl    %edi                 # Incrémente le pointeur de la deuxième chaîne
    jmp     compare              # Saut à l'étiquette compare pour répéter la boucle

# Cas où les chaînes sont égales
end_compare:
    movl    $0, %eax              # Charge zéro dans %eax (chaînes égales)
    jmp     finish_strcmp         # Saut à finish_strcmp

# Cas où les chaînes ne sont pas égales
not_equal:
    movl    $1, %eax              # Charge un dans %eax (chaînes non égales)

# Fin de strcmp
finish_strcmp:
    popl    %edi                 # Restaure le registre %edi
    popl    %esi                 # Restaure le registre %esi
    popl    %ebp                 # Restaure l'ancien pointeur de base de la pile
    ret

# Fonction principale main
main:
    xorl    %eax, %eax          # Initialise %eax à zéro

    pushl   $str1               # Pousse l'adresse de la première chaîne (str1) sur la pile
    pushl   $str2               # Pousse l'adresse de la deuxième chaîne (str2) sur la pile
    call    s_strcmp            # Appelle la fonction s_strcmp pour comparer les chaînes
    addl    $8, %esp            # Nettoie la pile après l'appel de la fonction

    pushl   %eax                # Pousse le résultat (0 pour égal, 1 pour non égal) sur la pile
    pushl   $format             # Pousse l'adresse du format sur la pile
    call    printf              # Appelle la fonction printf pour afficher le résultat
    addl    $8, %esp            # Nettoie la pile après l'appel de printf

    ret                          # Termine la fonction main
