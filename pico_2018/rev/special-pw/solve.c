#include <stdint.h>
#include <stdio.h>
#include <string.h>

uint32_t ror32(uint32_t x, int n) {
	return x >> n | x << 32 - n;
}

uint16_t rol16(uint16_t x, int n) {
	return x << n | x >> 16 - n;
}

int main(void) {
	char buf[] = "\xbd\x0e\x50\x1b\xef\x9e\x16\xd1\x7d\xe5\xc1\x55\xc9\x7f\xcf\x21\xc5\x99\x51\xd5\x7d\xc9\xc5\x9d\x21\xd3\x7d\xc1\xcd\xd9\x95\x8f\x91\x99\x97\xc5\xf5\xd1\x2d\xd5";

	for (int i = strlen(buf) - 4; i >= 0; i--) {
		*(uint32_t *)(buf + i) = ror32(*(uint32_t *)(buf + i), 0xa);
		*(uint16_t *)(buf + i) = rol16(*(uint16_t *)(buf + i), 0xf);
		buf[i] ^= 0x66;
	}

	puts(buf);
}
