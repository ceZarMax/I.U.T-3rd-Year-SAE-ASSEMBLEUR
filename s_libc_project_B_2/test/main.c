#include <stdio.h>
#include "../include/s_string.h"
#include "../include/s_maths.h"

int main() {
    char dest[50];
    const char *src = "hello";
    const char *src2 = " world";
    size_t n = 2;

    // Test s_strcpy
    printf("On va copier src dans dest : src : %s, dest : %s\n", src, dest);
    s_strcpy(dest, src);
    printf("s_strcpy: %s\n", dest);

    // Test s_strncpy
    printf("On va copier n caractère de src dans dest : src : %s, dest : %s, n : %zu\n", src, dest, n);
    s_strncpy(dest, src, n);
    printf("s_strncpy: %s\n", dest);

    // Test s_strcat
    printf("On va concaténer src et src2 dans dest : src : %s, src2 : %s, dest : %s\n", src, src2, dest);
    s_strcpy(dest, src);
    s_strcat(dest, src2);
    printf("s_strcat: %s\n", dest);

    // Test s_strncat
    printf("On va concaténer les n premiers caractères de src2 à dest : src : %s, src2 : %s, dest : %s, n : %zu\n", src, src2, dest, n);
    s_strcpy(dest, src);
    s_strncat(dest, src2, n);
    printf("s_strncat: %s\n", dest);

    // Test s_strlen
    printf("On va calculer la longueur de src : src : %s\n", src);
    size_t length = s_strlen(src);
    printf("s_strlen: %zu\n", length);

    // Test s_strcmp
    char str1[] = "abc";
    char str2[] = "abcd";
    printf("On va comparer str1 et str2 : str1 : %s, str2 : %s\n", str1, str2);
    int result_strcmp = s_strcmp(str1, str2);
    printf("s_strcmp: %d\n", result_strcmp);

    // Test s_strncmp
    printf("On va comparer les n premiers caractères de str1 et str2 : str1 : %s, str2 : %s, n : %zu\n", str1, str2, n);
    int result_strncmp = s_strncmp(str1, str2, n);
    printf("s_strncmp: %d\n", result_strncmp);

    // Test s_strchr
    //printf("On va rechercher 'e' dans src : src : %s\n", src);
    //int result_strchr = s_strchr(src, 'e');
    //printf("s_strchr: %d occurrences\n", result_strchr);

    printf("------------------------------------");
    printf("--------------s_smaths.--------------");
    printf("------------------------------------");

    // Test de s_abs
    int num1 = -10;
    int abs_num1 = s_abs(num1);
    printf("Valeur absolue de %d est %d\n", num1, abs_num1);

    // Test de s_div
    int dividend = 20;
    int divisor = 4;
    int result = s_div(dividend, divisor);
    printf("Division: %d / %d = %d\n", dividend, divisor, result);

    // Test de s_pow
    int base = 3;
    int exposant = 2;
    int resultat_pow = s_pow(base, exposant);
    printf("%d élevé à la puissance de %d est %d\n", base, exposant, resultat_pow);

    return 0;
}
