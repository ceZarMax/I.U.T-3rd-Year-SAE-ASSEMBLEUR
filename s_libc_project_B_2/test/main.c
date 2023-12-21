#include <stdio.h>
#include "s_string.h"
int main() {
	char *str = "Hello Maxence";
	int len = s_strlen(str);
	printf("Len de str = %d \n", len);
	return 0;
}

