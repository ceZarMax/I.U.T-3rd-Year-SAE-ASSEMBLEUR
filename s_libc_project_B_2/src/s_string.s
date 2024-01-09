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

.global s_strcpy
s_strcpy:
    pushl %ebp
    movl %esp, %ebp

    # Initialisation des registres
    movl 8(%ebp), %esi   # Adresse de début de la chaîne source
    movl 12(%ebp), %edi  # Adresse de début de la chaîne destination

    test %esi, %esi       # Vérifier si la source est nulle (pointeur non nul)
    jz  end_copy_loop     # Si c'est le cas, sauter à la fin de la boucle

    test %edi, %edi       # Vérifier si la destination est nulle (pointeur non nul)
    jz  end_copy_loop     # Si c'est le cas, sauter à la fin de la boucle

    xorl %eax, %eax       # Effacer des registres (mettre à zéro)

copy_loop:
    movb (%esi,%eax), %dl  # Chargement du caractère actuel de la source dans %dl
    cmpb $0, %dl            # Comparaison avec zéro pour marquer la fin de la chaîne source
    jz end_copy_loop       # Si c'est la fin, sauter à la fin de la boucle

    movb %dl, (%edi,%eax)  # Copie du caractère dans la destination
    incl %eax               # Incrémentation du compteur
    jmp copy_loop           # Saut pour répéter la boucle

end_copy_loop:
    pop %ebp  # Restauration de la valeur initiale du pointeur de base de la pile
    ret       # Retour de la fonction

