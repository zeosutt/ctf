#include <stdio.h>

int asm1(int);

int main(void) {
	printf("%#x\n", asm1(0xcd));
}
