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
    