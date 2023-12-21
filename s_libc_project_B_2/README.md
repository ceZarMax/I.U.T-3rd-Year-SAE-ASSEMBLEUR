Compiler un fichier assembleur : 

$ as --32 exo1.s -o exo1.o
$ ld -m elf_i386 exo1.o -o exo1

Commande de compilation : 
-s execstack : Cela indique au linker d'inclure la section .note.GNU-stack dans le binaire, ce qui résoud l'avertissement concernant la pile éxécutable.

gcc -m32 -Iinclude -z execstack test/main.c src/s_string.s -o my_prog

Comprendre les variables assembleur : 

http://www.lsv.fr/~goubault/CoursProgrammation/Doc/minic007.html

Pile en programmation : 
En programmation et en assembleur, la "pile" est une zone de mémoire spéciale utilisée pour stocker temporairement des informations. Elle fonctionne comme une pile d'assiettes : la dernière que vous ajoutez est la première que vous retirez.

En assembleur, on utilise la pile pour sauvegarder des informations importantes pendant l'exécution d'un programme, comme l'endroit où revenir après une fonction (adresse de retour) ou des valeurs temporaires. Cela aide à organiser et à gérer l'exécution du programme de manière ordonnée.
