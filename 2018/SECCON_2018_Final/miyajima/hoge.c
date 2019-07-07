// 引数として文字列strと文字列長len、およびint型のkeyが与えられるので、文字列strの各文字をkeyでxorする関数を実装してください。

// 条件
// str: 末尾がヌル文字の文字列
// 1 <= len <= 20
// 0 <= key <= 255

// Sample:
// str = "hi bob", len = 6, key = 0x20: strは"HI\0BOB" に書き換えられる。

// Hint:
// int型1つ分のstack領域が使えます。

#include <stdio.h>
#include <string.h>

void hoge(char *str, int len, int key) {
	while (len--) {
		str[len] ^= key;
	}
}

int main(void) {
	char buf[] = "hogepiyo";
	hoge(buf, strlen(buf), 'a');
	puts(buf);
}
