Compiler un fichier assembleur : 

$ as --32 exo1.s -o exo1.o
$ ld -m elf_i386 exo1.o -o exo1