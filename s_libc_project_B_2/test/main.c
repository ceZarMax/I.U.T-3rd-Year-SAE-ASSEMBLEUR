#include <stdio.h>
#include "../include/s_string.h"
#include "../include/s_maths.h"
#include "../include/s_stdlib.h"
#include "../include/s_stdio.h"


// Fonction pour tester s_strcpy
void test_s_strcpy() {
    char dest[50];
    const char *src = "hello";

    printf("On va copier src dans dest : src : %s, dest : %s\n", src, dest);
    s_strcpy(dest, src);
    printf("s_strcpy: %s\n", dest);
}

// Fonction pour tester s_strncpy
void test_s_strncpy() {
    char dest[50];
    const char *src = "hello";
    size_t n = 2;

    printf("On va copier %zu caractères de src dans dest : src : %s, dest : %s\n", n, src, dest);
    s_strncpy(dest, src, n);
    printf("s_strncpy: %s\n", dest);
}

// Fonction pour tester s_strcat
void test_s_strcat() {
    char dest[50];
    const char *src = "hello";
    const char *src2 = " world";

    printf("On va concaténer src et src2 dans dest : src : %s, src2 : %s\n", src, src2);
    s_strcpy(dest, src);
    s_strcat(dest, src2);
    printf("s_strcat: %s\n", dest);
}

// Fonction pour tester s_strncat
void test_s_strncat() {
    char dest[50];
    const char *src = "hello";
    const char *src2 = " world";
    size_t n = 2;

    printf("On va concaténer les %zu premiers caractères de src2 à dest : src : %s, src2 : %s\n", n, src, src2);
    s_strcpy(dest, src);
    s_strncat(dest, src2, n);
    printf("s_strncat: %s\n", dest);
}

// Fonction pour tester s_strlen
void test_s_strlen() {
    const char *src = "hello";

    printf("On va calculer la longueur de src : src : %s\n", src);
    size_t length = s_strlen(src);
    printf("s_strlen: %zu\n", length);
}

// Fonction pour tester s_strcmp
void test_s_strcmp() {
    char str1[] = "abc";
    char str2[] = "abcd";

    printf("On va comparer str1 et str2 : str1 : %s, str2 : %s\n", str1, str2);
    int result_strcmp = s_strcmp(str1, str2);
    printf("s_strcmp: %d\n", result_strcmp);
}

// Fonction pour tester s_strncmp
void test_s_strncmp() {
    char str1[] = "abc";
    char str2[] = "abcd";
    size_t n = 2;

    printf("On va comparer les %zu premiers caractères de str1 et str2 : str1 : %s, str2 : %s\n", n, str1, str2);
    int result_strncmp = s_strncmp(str1, str2, n);
    printf("s_strncmp: %d\n", result_strncmp);
}






// Fonction pour tester s_abs
void test_s_abs() {
    int num1 = -10;

    printf("Valeur absolue de %d est %d\n", num1, s_abs(num1));
}

// Fonction pour tester s_div
void test_s_div() {
    int dividend = 20;
    int divisor = 4;

    printf("Division: %d / %d = %d\n", dividend, divisor, s_div(dividend, divisor));
}

// Fonction pour tester s_pow
void test_s_pow() {
    int base = 3;
    int exposant = 2;

    printf("%d élevé à la puissance de %d est %d\n", base, exposant, s_pow(base, exposant));
}

// Fonction pour tester s_abs2
void test_s_abs2() {
    int num1 = -50;

    printf("Valeur absolue de %d est %d\n", num1, s_abs2(num1));
}

// Fonction pour tester s_atoi
void test_s_atoi() {
    const char *str = "123";

    printf("Conversion de la chaîne \"%s\" à un entier : %d\n", str, s_atoi(str));
}

// Fonction de test pour s_puts
void test_s_puts() {
    const char *str4 = "Hello, world!";
    printf("s_puts test: ");
    s_puts(str4);
    printf("\n");
}


int main() {
    printf("------------------------------------\n");
    printf("--------------s_string--------------\n");
    printf("------------------------------------\n");
    // Appeler les fonctions de test
    test_s_strcpy();
    test_s_strncpy();
    test_s_strcat();
    test_s_strncat();
    test_s_strlen();
    test_s_strcmp();
    test_s_strncmp();

    printf("------------------------------------\n");
    printf("--------------s_smaths--------------\n");
    printf("------------------------------------\n");

    test_s_abs();
    test_s_div();
    test_s_pow();

    printf("------------------------------------\n");
    printf("--------------s_stdlib--------------\n");
    printf("------------------------------------\n");

    test_s_abs2();
    test_s_atoi();

    printf("------------------------------------\n");
    printf("--------------s_stdio---------------\n");
    printf("------------------------------------\n");

    test_s_puts();

    return 0;
}
