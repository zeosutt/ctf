from Cryptodome.Hash import keccak
from Cryptodome.Util.number import long_to_bytes

answer = 'ed2a0ca74e236c332625ad7f4db75b63d2a2ee7e3fe52c2c93c8dbc4e06906d1'
for i in range(2 ** 16):
	if keccak.new(data=long_to_bytes(i, 2), digest_bits=256).hexdigest() == answer:
		print(i)
		break
