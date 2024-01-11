#include <stdio.h>
#include "s_string.h"

int main() {
   
    char *str = "Hello";
    int len = s_strlen(str);
    printf("Len de str = %d \n", len);
    
    char* source = "Hello, World!";
    char* destination;

    // Appel de la fonction my_strcpy
    s_strcpy(destination, source);

    // Affichage du résultat
    printf("Source: %s\n", source);
    printf("Destination: %s\n", destination);
    
    // STRNCPY
    s_strncpy(destination, source, 5);
    
    printf("Source: %s\n", source);
    printf("Destination: %s\n", destination);
    


    return 0;
}

