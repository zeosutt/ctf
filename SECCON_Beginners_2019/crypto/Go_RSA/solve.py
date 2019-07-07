from pwn import *
from Crypto.Util.number import long_to_bytes
from fractions import gcd

while True:
	r = remote('133.242.17.175', 1337)

	r.recvuntil('Encrypted flag is: ')
	encrypted = int(r.recvline())

	r.sendlineafter('> ', '2')
	c2 = int(r.recvline())

	r.sendlineafter('> ', '4')
	c4 = int(r.recvline())

	r.sendlineafter('> ', '8')
	c8 = int(r.recvline())

	r.recvuntil('The D was ')
	d = int(r.recvline())

	r.close()

	n = gcd(c2 * c2 - c4, c2 * c4 - c8)
	flag = long_to_bytes(pow(encrypted, d, n))

	if flag.startswith('ctf4b'):
		break

print(long_to_bytes(pow(encrypted, d, n)))
