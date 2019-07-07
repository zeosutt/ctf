#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

char code[200001][33];

int use[200001];
int use_specific[200001][500];

int id(const char *target) {
	if (target[2] == '%')
		if (target[4] == 'd')
			if (target[5] == 'x')
				return 3;
			else
				return 5;
		else if (target[4] == 's')
			return 4;
		else
			return target[4] - 'a';
	else
		return atoi(target + 3) / 4 + 8;
}

void resolve_depend(int depend_line, const char *depend_target) {
	use[depend_line] = 1;

	if (depend_target[2] == '$')
		return;

	if (use_specific[depend_line][id(depend_target)])
		return;

	use_specific[depend_line][id(depend_target)] = 1;

	fprintf(stderr, "%d %s\n", depend_line, depend_target);

	for (int line = depend_line - 1; line >= 3; line--)
		if (strstr(code[line], depend_target)) {
			char op[6], src[15], src2[15], target[15];
			sscanf(code[line], "%s\t%[^,]", op, src);

			fprintf(stderr, "%d\t%s %s\n", line, op, src);

			if (!strcmp(op, "movl")) {
				sprintf(target, ", %s", src);
				resolve_depend(line, target);
			} else if (!strcmp(op, "xorl") || !strcmp(op, "andl") || !strcmp(op, "orl") || !strcmp(op, "imull") || !strcmp(op, "subl") || !strcmp(op, "addl")) {
				sprintf(target, ", %s", src);
				resolve_depend(line, target);

				resolve_depend(line, depend_target);
			} else if (!strcmp(op, "leal")) {
				sscanf(code[line], "%*s\t(%[^,],%[^)]", src, src2);
				src[1] = src2[1] = 'e';

				sprintf(target, ", %s", src);
				resolve_depend(line, target);

				sprintf(target, ", %s", src2);
				resolve_depend(line, target);
			}

			break;
		}
}

int main(void) {
	int pipefd_to_nc[2], pipefd_from_nc[2];

	pipe(pipefd_to_nc);
	pipe(pipefd_from_nc);

	if (fork() == 0) {
		close(pipefd_to_nc[1]);
		dup2(pipefd_to_nc[0], 0);
		close(pipefd_to_nc[0]);

		close(pipefd_from_nc[0]);
		dup2(pipefd_from_nc[1], 1);
		close(pipefd_from_nc[1]);

		execlp("nc", "nc", "coconut.chal.pwning.xxx", "6817", NULL);
	}

	close(pipefd_to_nc[0]);
	FILE * const fp_to_nc = fdopen(pipefd_to_nc[1], "w");

	close(pipefd_from_nc[1]);
	FILE * const fp_from_nc = fdopen(pipefd_from_nc[0], "r");

	FILE * const fp_log = fopen("log", "w");

	while (1) {
		memset(use, 0, sizeof use);
		memset(use_specific, 0, sizeof use_specific);

		char input[128];

		while (fgets(input, 128, fp_from_nc)) {
			fprintf(fp_log, "%s", input);
			if (strstr(input, "optimize:"))
				break;
		}
		fflush(fp_log);

		int line;
		for (line = 1; fscanf(fp_from_nc, "%*d\t%[^\n]", code[line]) == 1; line++) ;

		if (line <= 1)
			break;

		use[1] = use[2] = use[3] = use[4] = use[line - 2] = use[line - 1] = 1;
		if (strstr(code[5], "subq"))
			use[5] = 1;

		for (int i = 1; i < line; i++) {
			fprintf(stderr, "%d\t%s\n", i, code[i]);
			fprintf(fp_log, "%d\t%s\n", i, code[i]);
		}

		const char * const initial_target = ", %eax";
		resolve_depend(line, initial_target);

		int start = -1;
		for (int i = 1; i < line; i++)
			if (use[i]) {
				if (start != -1) {
					fprintf(fp_to_nc, "%d-%d\n", start, i - 1);
					fprintf(fp_log, "%d-%d\n", start, i - 1);
					start = -1;
				}
				fprintf(stderr, "%d\t%s\n", i, code[i]);
			} else
				if (start == -1)
					start = i;
		if (start != -1) {
			fprintf(fp_to_nc, "%d-%d\n", start, line - 1);
			fprintf(fp_log, "%d-%d\n", start, line - 1);
		}
		fprintf(fp_to_nc, "#\n");
		fprintf(fp_log, "#\n");

		fflush(fp_to_nc);
	}

	return 0;
}
