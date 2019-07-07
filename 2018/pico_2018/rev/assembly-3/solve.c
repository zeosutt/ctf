#include <stdio.h>

int asm3(int, int, int);

int main(void) {
	printf("%#x\n", asm3(0xbda42100, 0xb98dd6a5, 0xecded223));
}
