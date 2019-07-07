#include <stdio.h>

int main(void) {
	int x;

	printf("%10c%10c%n\n", 0x00, 0x00, &x);

	printf("%d\n", x);
}
