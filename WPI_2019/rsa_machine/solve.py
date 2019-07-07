from pwn import *
from Crypto.PublicKey import RSA
from Crypto.Util.number import *
import itertools

r = remote('rsamachine.wpictf.xyz', 31337)

pubkey = RSA.importKey(r.recvuntil('-----END PUBLIC KEY-----\n'))
n = pubkey.n
e = pubkey.e

command = 'getflag'

c = int(command.encode('hex'), 16)

for k in itertools.count(2):
	ck = (c * pow(k, e, n)) % n

	ck_str = long_to_bytes(ck)
	if '\n' in ck_str:
		continue

	r.sendline('sign ' + ck_str)

	mk = int(r.recvline())
	sig = mk * inverse(k, n) % n

	r.sendline('getflag ' + str(sig))

	print(r.recvall())

	break
