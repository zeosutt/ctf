#include <stdio.h>
#include <stdlib.h>

#include <unistd.h>
#include <sys/prctl.h>
#include <linux/filter.h>
#include <linux/seccomp.h>

// init_seccomp
void sub_930(void) {
	struct sock_filter filter[20] = {
		// {0x20, 0x00, 0x00, 0x00000004},
		// {0x15, 0x00, 0x10, 0xc000003e},
		// {0x20, 0x00, 0x00, 0x00000020},
		// {0x07, 0x00, 0x00, 0x00000000},
		// {0x20, 0x00, 0x00, 0x00000000},
		// {0x15, 0x0d, 0x00, 0x00000000},
		// {0x15, 0x0c, 0x00, 0x00000001},
		// {0x15, 0x0b, 0x00, 0x00000005},
		// {0x15, 0x0a, 0x00, 0x00000008},
		// {0x15, 0x01, 0x00, 0x00000009},
		// {0x15, 0x00, 0x03, 0x0000000a},
		// {0x87, 0x00, 0x00, 0x00000000},
		// {0x54, 0x00, 0x00, 0x00000001},
		// {0x15, 0x04, 0x05, 0x00000001},
		// {0x1d, 0x04, 0x00, 0x0000000b},
		// {0x15, 0x03, 0x00, 0x0000000c},
		// {0x15, 0x02, 0x00, 0x0000003c},
		// {0x15, 0x01, 0x00, 0x000000e7},
		// {0x06, 0x00, 0x00, 0x00000000},
		// {0x06, 0x00, 0x00, 0x7fff0000},

		// アーキテクチャがx86_64であることを確認
		BPF_STMT(BPF_LD | BPF_W | BPF_ABS, offsetof(struct seccomp_data, arch)),
		BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, AUDIT_ARCH_X86_64, 0, 16),

		// システムコールの第3引数をXレジスタに代入
		BPF_STMT(BPF_LD | BPF_W | BPF_ABS, offsetof(struct seccomp_data, args[2])),
		BPF_STMT(BPF_MISC | BPF_TAX),

		// システムコール番号を取得
		BPF_STMT(BPF_LD | BPF_W | BPF_ABS, offsetof(struct seccomp_data, nr)),

		// read、write、fstat、lseekを許可
		BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, __NR_read, 13, 0),
		BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, __NR_write, 12, 0),
		BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, __NR_fstat, 11, 0),
		BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, __NR_lseek, 10, 0),

		// mmap、mprotectの場合、第3引数（prot）にPROT_READが立っているとアウト。立っていなければOK
		BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, __NR_mmap, 1, 0),
		BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, __NR_mprotect, 0, 3),
		BPF_STMT(BPF_MISC | BPF_TXA),
		BPF_STMT(BPF_ALU | BPF_AND | BPF_K, 1),
		BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, 1, 4, 5),

		// %rdxがシステムコール番号と等しければ許可（！！！）
		BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_X, __NR_munmap, 4, 0),

		// brk、exit、exit_groupを許可
		BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, __NR_brk, 3, 0),
		BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, __NR_exit, 2, 0),
		BPF_JUMP(BPF_JMP | BPF_JEQ | BPF_K, __NR_exit_group, 1, 0),

		BPF_STMT(BPF_RET | BPF_K, SECCOMP_RET_KILL),
		BPF_STMT(BPF_RET | BPF_K, SECCOMP_RET_ALLOW),
	};
	struct sock_fprog prog = {
		.len = 20,
		.filter = filter,
	};

	prctl(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0);
	if (prctl(PR_SET_SECCOMP, SECCOMP_MODE_FILTER, &prog)) {
		perror("prctl");
		exit(1);
	};
}

// init
void sub_9f0(void) {
	alarm(120);
	setvbuf(stdout, NULL, _IONBF, 0);

	// init_seccomp
	sub_930();
}

// show_menu
void sub_a29(void) {
	puts("-----> Safe Memo <-----");
	puts("1. show");
	puts("2. memo");
	puts("3. exit");
	puts("Choice?");
}

// sub_a6c
int main(int argc, char *argv[]) {
	// init
	sub_9f0();

	long long memo[200] = {0};	// rbp - 0x650

	while (1) {
		// show_menu
		sub_a29();

		int x;					// rbp - 0x658
		scanf("%d", &x);

		if (x == 1 || x == 2) {
			int idx;			// rbp - 0x654
			puts("Idx?");
			scanf("%d", &idx);

			// 1. show
			if (x == 1) {
				printf("Here it is: %lld\n", memo[idx]);
			}
			// 2. memo
			else {
				puts("Give me your number:");
				scanf("%lld", &memo[idx]);
			}
		} else {
			break;
		}
	}

	return 0;
}
