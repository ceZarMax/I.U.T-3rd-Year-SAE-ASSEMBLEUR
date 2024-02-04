.text

.global init

init:
    ret

######################################
######### Fonction s_strlen ##########
######################################
.global s_strlen
s_strlen:
        # SAUVEGARDE de l'état initial de la pile :
    pushl %ebp # Pousser valeur pointeur de base de la pile (%ebp) sur la pile
    movl %esp, %ebp # Copier valeur actuelle pointeur de pile (%esp) dans (%ebp)
        
        # Initialisation des registres
    movl 8(%ebp), %esi # @ de début de la chaine
    xorl %eax, %eax # Effacer des registres (mettre à 0)
# Boucle de calcul de la longueur de la chaine
sum_loop:
    movb (%esi,%eax), %dl # Correspond au caractère actuel de la chaine
    cmpb $0, %dl # compare le caractère à zéro pour marquer la fin de la chaine
    jz end_sum_loop # si le caractère est à zéro, on saute à end_sum_loop
    
        incl %eax # Sinon, on include (incrémente) le compteur %eax pour passer au car suivant
    jmp sum_loop # On saute à sum_loop pour répéter la boucle
# Fin de la boucle et nettoyage de la pile
end_sum_loop:
    pop %ebp #restaure la valeur initiale du pointeur de base de la pile
    ret # return

######################################
######### Fonction s_strcpy ##########
######################################
.text

.section .text
.global s_strcpy

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

######################################
######### Fonction s_strncpy #########
######################################

.text

.section .text
.global s_strncpy

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
    
######################################
######### Fonction s_strcat# #########
######################################    

.text

.section .text
.global s_strcat

# Fonction de copie de chaîne s_strcpy
s_strcpy_cat:
    pushl   %ebp                   # Sauvegarde l'ancien pointeur de base de la pile
    movl    %esp,   %ebp           # Initialise un nouveau cadre de pile
    pushl   %esi                   # Sauvegarde le registre %esi
    pushl   %edi                   # Sauvegarde le registre %edi
    movl    12(%ebp), %esi         # Récupère l'adresse de la chaîne source (src)
    movl    8(%ebp), %edi          # Récupère l'adresse du tableau de destination (dest)
    movl    %edi,    %eax           # Copie l'adresse de dest dans %eax

# Boucle de copie
cp_cat:
    cmpb    $0, (%esi)             # Compare le caractère actuel de la source avec zéro (fin de chaîne)
    je      fincp_cat                   # Si fin de chaîne, saute à fincp
    movb    (%esi), %dl            # Copie le caractère actuel de la source dans %dl
    movb    %dl,    (%edi)         # Copie %dl à l'adresse de destination (%edi)
    incl    %esi                   # Incrémente le pointeur source
    incl    %edi                   # Incrémente le pointeur destination
    jmp     cp_cat                     # Saut à l'étiquette cp pour répéter la boucle

# Fin de la fonction
fincp_cat:
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
find_end_strcat:
    cmpb    $0, (%edi)             # Compare le caractère actuel de la destination avec zéro
    je      copy_cat               # Si fin de chaîne, saute à copy_cat
    incl    %edi                   # Incrémente le pointeur destination
    jmp     find_end_strcat               # Saut à l'étiquette find_end pour répéter la boucle

# Copier la chaîne source à la fin de la chaîne destination
copy_cat:
    jmp     cp_cat                     # Saut à l'étiquette cp (fonction de copie)

######################################
######### Fonction s_strncat  ########
######################################  

.text

.section .text
.global s_strncat
  
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
find_end_strncat:
    cmpb    $0, (%edi)             # Compare le caractère actuel de la destination avec zéro
    je      copy_strncat               # Si fin de chaîne, saute à copy_cat
    incl    %edi                   # Incrémente le pointeur destination
    jmp     find_end_strncat               # Saut à l'étiquette find_end pour répéter la boucle

# Copier la chaîne source à la fin de la chaîne destination
copy_strncat:
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

######################################
######### Fonction s_strcmp   ########
######################################  

.text

.section .text
.global s_strcmp

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
######################################
######### Fonction s_strncmp  ########
######################################
.text

.section .text
.global s_strcmp
    
# Fonction de comparaison de chaînes s_strncmp
s_strncmp:
    pushl   %ebp                 # Sauvegarde l'ancien pointeur de base de la pile
    movl    %esp, %ebp           # Initialise un nouveau cadre de pile
    pushl   %esi                 # Sauvegarde le registre %esi
    pushl   %edi                 # Sauvegarde le registre %edi
    pushl   %ebx                 # Sauvegarde le registre %ebx
    movl    16(%ebp), %ecx       # Récupère le nombre de caractères à comparer (n)
    movl    12(%ebp), %esi       # Récupère l'adresse de la première chaîne (str1)
    movl    8(%ebp), %edi       # Récupère l'adresse de la deuxième chaîne (str2)

# Boucle de comparaison
compare2:
    movb    (%esi), %al          # Charge le caractère de la première chaîne dans %al
    movb    (%edi), %dl          # Charge le caractère de la deuxième chaîne dans %dl
    cmpb    $0, %al              # Compare le caractère de la première chaîne avec zéro (fin de chaîne)
    je      end_compare2          # Si fin de chaîne, saute à end_compare
    cmpb    $0, %dl              # Compare le caractère de la deuxième chaîne avec zéro (fin de chaîne)
    je      end_compare2          # Si fin de chaîne pour la deuxième chaîne, saute à end_compare
    cmpb    %dl, %al             # Compare les caractères actuels des deux chaînes
    jne     not_equal2            # Si les caractères ne sont pas égaux, saute à not_equal
    incl    %esi                 # Incrémente le pointeur de la première chaîne
    incl    %edi                 # Incrémente le pointeur de la deuxième chaîne
    loop    compare2              # Répète la boucle jusqu'à ce que %ecx atteigne zéro

# Cas où les chaînes sont égales
end_compare2:
    movl    $0, %eax              # Charge zéro dans %eax (chaînes égales)
    jmp     finish_strncmp        # Saut à finish_strncmp

# Cas où les chaînes ne sont pas égales
not_equal2:
    movl    $1, %eax              # Charge un dans %eax (chaînes non égales)

# Fin de strncmp
finish_strncmp:
    popl    %ebx                 # Restaure le registre %ebx
    popl    %edi                 # Restaure le registre %edi
    popl    %esi                 # Restaure le registre %esi
    popl    %ebp                 # Restaure l'ancien pointeur de base de la pile
    ret
######################################
######### Fonction s_strchr   ########
######################################  
.text

.section .text
.global s_strchr
    
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