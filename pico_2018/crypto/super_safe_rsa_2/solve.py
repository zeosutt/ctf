import owiener
from Crypto.Util.number import *
from pwn import *

r = remote('2018shell1.picoctf.com', 29661)

r.recvuntil('c: ')
c = int(r.recvline())

r.recvuntil('n: ')
n = int(r.recvline())

r.recvuntil('e: ')
e = int(r.recvline())

d = owiener.attack(e, n)

if d is None:
	print('Failed')
else:
	print(long_to_bytes(pow(c, d, n)))
