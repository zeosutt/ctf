#include <stdio.h>
#include <string.h>

char str[][50] = {
	"\x6a\xf7\x15\xeb\x17\xb7\x34\x0f\x07\xf7\x04\xfb\xc0\x14\x26\x07\xf8\xfd\x0d\x8e",
	"\x6a\xf7\x15\xeb\x17\xb7\x34\x0f\x07\xf7\x04\xfb\xc0\x44\xfd\xf5\xfe\xcc\x24\x12\xfe\x0f\xf3\x0f\xd7\x1a\x14\xda\x1d\xf5\xfe\x9d",
	"\x6a\xf7\x15\xeb\xce\x44\xf2\xfe\x12\xfd\xf7\x0b\x05\xb6\x1e\x18\x0e\x00\xee\x06\xfe\xdf\x25\xfe\xfe\x0e\x01\x8c",
	"\x6a\xf7\x15\xeb\xce\x46\xff\xf5\x03\xc3\x23\x0f\x0d\xf6\x0b\xfe\x93\x67",

	"\x67\xfe\x0f\xd5\x25\x05\x01\xed\x0d\xf5\x02\x9b",
	"\x28\x24\x1e\xf7\x15\xeb\xce\x3d\xf5\x0d\xf9\xc8\x24\x21\xfe\xf7\x05\xf9\xd4\xee\x23\x1e\xf7\x15\xeb\x17\xb7\x34\x0f\x07\xf7\x04\xfb\xc0\x14\x26\x07\xf8\xfd\x0d\xc9\xc5",

	"\x3c\x2d\x05\xfb\x0b\xca\xc2",
	"\x28\x33\xe7\x0a\x1e\xf7\x15\xeb\xce\x3d\xf5\x0d\xf9\xc8\x24\x21\xfe\xf7\x05\xf9\xd4\xee\x2d\xaa",

	"\x69\x05\xfb\x0b\x8c",
	"\x28\x21\x03\x1e\xf7\x15\xeb\xce\x44\xf2\xfe\x12\xfd\xf7\x0b\x05\xb6\x1c\x1a\x14\xc2\xee\x2d\xaa",

	"\x64\x0b\xd7\x23\x05\xf3\x0b\x94",
	"\x28\x33\xe7\xe7\x32\xe7\xbe",

	"\x67\xfe\x0f\xd5\x25\x05\x01\xed\x0d\xf5\x02\x9b",
	"\x28\x24\x1e\xf7\x15\xeb\xce\x3d\xf5\x0d\xf9\xc8\x24\x21\xfe\xf7\x05\xf9\xd4\xee\x23\x1e\xf7\x15\xeb\xce\x44\xf2\xfe\x12\xfd\xf7\x0b\x05\xb6\x1e\x18\x0e\x00\xee\x06\xfe\xdf\x25\xfe\xfe\x0e\x01\xc7\xc5",

	"\x75\xfb\xf4\xfd\x13\xf1\x9b",
	"\x28\x33\xe7\xe7\x2d\xaa",

	"\x64\x05\xfe\xfe\x0e\x01\x8c",
	"\x28\x01\x32\xe7\xbe",

	"\x3c\x2d\x05\xfb\x0b\xca\xc2",
	"\x28\x22\xdf\x2d\xaa",

	"\x6e\xf7\x13\xfc\xce\x37\xfb\xf1\x0e\x8d",
	"\x28\x33\xe7\xe7\x2d\xaa",

	"\x41\x04\x0e\xdc\x16\xfe\xff\xed\x1f\x21\xe1\x11\x03\x00\x05\x05\xf9\x99",
	"\x41\x04\x0e\xad",
	"\x53\xf5\xf9\xec\x05\x03\x01\xca",
};


int main(void) {
	for (int i = 0; i < sizeof str / sizeof str[0]; i++) {
		for (int j = 1; j < 50; j++)
			str[i][j] += str[i][j - 1];
		puts(str[i]);
	}

	return 0;
}

