#ifndef S_STRING_H
#define S_STRING_H

#include <stddef.h>

extern char* s_strcpy(char* dest, const char* src);

extern char* s_strncpy(char* dest, const char* src, size_t n);

extern char* s_strcat(char* dest, const char* src);

extern char* s_strncat(char* dest, const char* src, size_t n);

extern size_t s_strlen(const char* str);

extern int s_strcmp(const char* str1, const char* str2);

extern int s_strncmp(const char *str1, const char *str2, size_t n);

extern int s_strchr(const char *str, int c);

#endif /* S_STRING_H */
