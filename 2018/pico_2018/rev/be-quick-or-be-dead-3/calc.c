#include <stdio.h>

unsigned a[0x19966] = {0x2345, 0x2345 + 1, 0x2345 + 4, 0x2345 + 9, 0x2345 + 16};

int main(void) {
	for (int i = 5; i <= 0x19965; i++)
		a[i] = a[i - 5] * 0x1234 + (a[i - 1] - a[i - 2]) + (a[i - 3] - a[i - 4]);
	printf("\\x%x\\x%x\\x%x\\x%x", a[0x19965] & 0xff, a[0x19965] >> 8 & 0xff, a[0x19965] >> 16 & 0xff, a[0x19965] >> 24);
}
