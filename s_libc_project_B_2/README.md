
# Projet s_libc

## Description
Le projet s_libc est une bibliothèque C minimaliste implémentée en assembleur 32 bits. Elle offre des fonctions de base similaires à celles de la libc standard, mais avec une implémentation personnalisée.

## Organisation : 

TRELLO : https://trello.com/b/FHbOBVwV/sae-assembleur-v2


## Fonctionnalités
- **s_string**: Fonctions de manipulation de chaînes de caractères.
- **s_maths**: Fonctions mathématiques basiques.
- **s_stdlib**: Fonctions de la bibliothèque standard (abs, atoi, etc.).
- **s_stdio**: Fonctions d'entrée/sortie basiques (s_puts).

## Comment utiliser
1. Clonez le dépôt Git : `git clone https://github.com/ceZarMax/I.U.T-3rd-Year-SAE-ASSEMBLEUR`
2. Allez dans le répertoire du projet : `cd s_libc_project_B_2`
3. Compilez la bibliothèque : `make`
4. Exécutez les tests : `make test`

## Installer les man pages
1. Allez dans le répertoire du dossier : `cd s_libc_project_B_2/doc`
2. Copier les fichiers man dans le dossier man3 : `sudo cp *.3 /usr/share/man/man3/`
3. Actualiser le man : `sudo mandb`
4. Utiliser le man : `man s_string`

## Auteurs
- GIRAULT Adrien
- ARVIN-BEROD Maxence
- HUBERT Quentin

## Licence
Ce projet est distribué sous la licence de l'I.U.T de Vélizy

## Remarques
- Ce projet a été réalisé dans le cadre de la SAE Assembleur à l'Université de Vélizy. 2023
- Pour toute question ou commentaire, veuillez nous contacter à [maxence.ab@gmail.com], [adri1girault@gmail.com], [quentin.hub19@gmail.com].

## Debug
`gdb ./test`
`run`
`bt`

## Comprendre les registres : 

Les registres x86 sont des emplacements de stockage internes au processeur qui sont utilisés pour effectuer des opérations temporaires, stocker des données, et gérer le flux d'instructions. Voici une brève description de chaque registre :

1. **%eax (Accumulator Register) :**
   - Il est souvent utilisé pour stocker des résultats de calculs, des valeurs de retour de fonctions et d'autres opérations arithmétiques. 
   - C'est un registre de 32 bits, mais ses parties inférieures (AX, AH, AL) peuvent être utilisées pour des opérations plus spécifiques.

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

9. **%eip (Instruction Pointer) :**
   - Registre du processeur qui contient l'adresse mémoire de l'instruction suivante à être exécutée. Il pointe vers l'instruction dans la mémoire à partir de laquelle le processeur doit extraire et exécuter les opcodes.

Chacun de ces registres a des utilisations conventionnelles, mais dans la pratique, les programmeurs peuvent choisir d'utiliser ces registres différemment en fonction de leurs besoins. Les registres `%ebp` et `%esp` sont particulièrement importants pour la gestion de la pile, tandis que les autres sont souvent utilisés pour des opérations arithmétiques, logiques et pour l'accès à la mémoire.

## Comprendre les variables assembleur : 

http://www.lsv.fr/~goubault/CoursProgrammation/Doc/minic007.html

**XOR :**
   - Mettre à 0 le registre %eax

**movl :**
   - Move long :  
     - Copie les 32 bits (8 octets) de la source vers la destination.

**movb :**
   - Move byte :
     - Copie 8 bits (2 octets) de la source vers la destination.

**movw :**
   - Move word :
     - Copie un mot de 16 bits (4 octets) de la source vers la destination.


## **Makefile** : 

Notre Makefile compile les fichiers source .s dans le répertoire src en objets .o dans le répertoire build. Ensuite, il construit une bibliothèque partagée dans le répertoire lib à partir des objets. Enfin, il compile un programme de test dans le répertoire test qui utilise cette bibliothèque partagée. La cible "all" exécute ces étapes, tandis que "clean" supprime les fichiers générés.


Pile en programmation : 
En programmation et en assembleur, la "pile" est une zone de mémoire spéciale utilisée pour stocker temporairement des informations. Elle fonctionne comme une pile d'assiettes : la dernière que vous ajoutez est la première que vous retirez.

En assembleur, on utilise la pile pour sauvegarder des informations importantes pendant l'exécution d'un programme, comme l'endroit où revenir après une fonction (adresse de retour) ou des valeurs temporaires. Cela aide à organiser et à gérer l'exécution du programme de manière ordonnée.