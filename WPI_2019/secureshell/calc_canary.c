#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <openssl/md5.h>

unsigned find_seed(unsigned unixtime, const char *target) {
	for (int i = 0; i < 5000000; i++) {
		const unsigned seed = unixtime * 1000000 + i;
		srand(seed);

		char message[4];
		char digest[MD5_DIGEST_LENGTH];

		rand();
		rand();
		*(int *)message = rand();

		MD5_CTX md5_ctx;
		MD5_Init(&md5_ctx);
		MD5_Update(&md5_ctx, message, 4);
		MD5_Final(digest, &md5_ctx);

		if (memcmp(digest, target, MD5_DIGEST_LENGTH) == 0)
			return seed;
	}

	puts("oh my god!");
	exit(1);
}

unsigned long long calc_canary(unsigned seed) {
	srand(seed);

	rand();
	rand();
	rand();

	unsigned long long canary = 0;
	canary ^= rand();
	canary <<= 0x20;
	canary ^= rand();

	return canary;
}

int main(int argc, char **argv) {
	const unsigned unixtime = atoi(argv[1]);
	const char *target = argv[2];

	assert(strlen(target) == MD5_DIGEST_LENGTH);

	const unsigned seed = find_seed(unixtime, target);

	const unsigned long long canary = calc_canary(seed);
	printf("%016llx\n", canary);

	return 0;
}
