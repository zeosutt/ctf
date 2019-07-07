#include <stdio.h>
#include <unistd.h>

int main(int argc, char **argv) {
	puts(argv[1]);
	execve(argv[1], NULL, NULL);
	puts(argv[1]);
	return 0;
}
