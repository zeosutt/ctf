from pwn import *

r = remote('tekeisan-ekusutoriim.chall.beginners.seccon.jp', 8690)

r.recvlines(11)

for i in xrange(100):
	r.recvuntil(')\n')
	r.sendline(str(eval(r.recvuntil('=')[:-1])))

r.interactive()
