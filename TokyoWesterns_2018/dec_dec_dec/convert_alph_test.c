#include <stdio.h>

int convert_upper(int);
int convert_lower(int);

int main(void) {
	for (int ch = 'A'; ch <= 'Z'; ch++)
		putchar(convert_upper(ch));
	putchar('\n');
	for (int ch = 'a'; ch <= 'z'; ch++)
		putchar(convert_lower(ch));
	putchar('\n');
}
