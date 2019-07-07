from Crypto.Cipher import AES

class PRNG:
	def __init__(self, seed):
		self.x = seed

	def next(self):
		tmp = self.x
		self.x ^= tmp << 7
		self.x ^= tmp << 11
		self.x ^= tmp >> 4
		self.x &= 0xffff
		return tmp

def genkey(seed):
	prng = PRNG(seed)
	key = b''
	for _ in range(16):
		key = prng.next().to_bytes(2, 'little') + key
	return key

encrypted = b'\x10\x29\xb8\x45\x9d\x2a\xab\x93\xfe\x89\xfb\x82\x93\x42\xa1\x8c\x2e\x90\x63\x00\x06\x11\x80\x64\xb8\x21\xc2\x9f\x35\xe7\x7e\xf2'

for i in range(0x10000):
	key = genkey(i)
	aes = AES.new(key)
	decrypted = aes.decrypt(encrypted)
	if decrypted.startswith(b'35C3'):
		print(decrypted)
		print(hex(i))
