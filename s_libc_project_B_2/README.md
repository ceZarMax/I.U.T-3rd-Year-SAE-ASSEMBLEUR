Compiler un fichier assembleur : 

$ as --32 exo1.s -o exo1.o
$ ld -m elf_i386 exo1.o -o exo1

Commande de compilation : 
-s execstack : Cela indique au linker d'inclure la section .note.GNU-stack dans le binaire, ce qui résoud l'avertissement concernant la pile éxécutable.

gcc -m32 -Iinclude -z execstack test/main.c src/s_string.s -o my_prog

Comprendre les variables assembleur : 

http://www.lsv.fr/~goubault/CoursProgrammation/Doc/minic007.html

Comprendre les registres : 

Les registres x86 sont des emplacements de stockage internes au processeur qui sont utilisés pour effectuer des opérations temporaires, stocker des données, et gérer le flux d'instructions. Voici une brève description de chaque registre :

1. **%eax (Accumulator Register) :**
   - Utilisé comme registre accumulateur pour stocker les résultats des opérations arithmétiques et logiques.
   - Peut également être utilisé pour les valeurs de retour de fonctions.

2. **%ebx (Base Register) :**
   - Souvent utilisé comme registre de base pour des accès mémoire indirects ou pour stocker des valeurs temporaires.

3. **%ecx (Count Register) :**
   - Souvent utilisé comme compteur dans des boucles (par exemple, dans des instructions de répétition comme `rep`).

4. **%edx (Data Register) :**
   - Utilisé comme registre de données pour stocker des résultats temporaires ou des parties de résultats.

5. **%esi (Source Index Register) :**
   - Souvent utilisé comme indice source lors de l'accès à des tableaux ou de la copie de données.

6. **%edi (Destination Index Register) :**
   - Souvent utilisé comme indice destination lors de l'accès à des tableaux ou de la copie de données.

7. **%ebp (Base Pointer Register) :**
   - Utilisé comme pointeur de base pour accéder aux variables locales et aux paramètres de fonction sur la pile.

8. **%esp (Stack Pointer Register) :**
   - Utilisé comme pointeur de pile pour indiquer le sommet actuel de la pile.

Chacun de ces registres a des utilisations conventionnelles, mais dans la pratique, les programmeurs peuvent choisir d'utiliser ces registres différemment en fonction de leurs besoins. Les registres `%ebp` et `%esp` sont particulièrement importants pour la gestion de la pile, tandis que les autres sont souvent utilisés pour des opérations arithmétiques, logiques et pour l'accès à la mémoire.

Pile en programmation : 
En programmation et en assembleur, la "pile" est une zone de mémoire spéciale utilisée pour stocker temporairement des informations. Elle fonctionne comme une pile d'assiettes : la dernière que vous ajoutez est la première que vous retirez.

En assembleur, on utilise la pile pour sauvegarder des informations importantes pendant l'exécution d'un programme, comme l'endroit où revenir après une fonction (adresse de retour) ou des valeurs temporaires. Cela aide à organiser et à gérer l'exécution du programme de manière ordonnée.
