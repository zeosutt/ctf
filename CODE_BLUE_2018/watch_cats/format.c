#include <stdio.h>

int main(void) {
	int n;

	scanf("%d", &n);

	for (int i = 0; i < n; i++) {
		int v[4];

		scanf("%*d %d %d %d %d", v, v + 1, v + 2, v + 3);

		printf("    %4d\n", v[0] + 1);
		printf("%4d%4d%4d\n", v[3] + 1, -i - 1, v[1] + 1);
		printf("    %4d\n", v[2] + 1);
		putchar('\n');
	}

	return 0;
}
