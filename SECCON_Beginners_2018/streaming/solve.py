class Stream:
	A = 37423
	B = 61781
	C = 34607
	def __init__(self, seed):
		self.seed = seed % self.C

	def __iter__(self):
		return self

	def next(self):
		self.seed = (self.A * self.seed + self.B) % self.C
		return self.seed

with open('encrypted', 'rb') as f:
	encrypted = f.read()
	a = ord(encrypted[0]) + ord(encrypted[1]) * 256
	seed = a ^ int('ct'.encode('hex'), 16)

	g = Stream(seed)

	flag = 'ct'
	for i in range(2, len(encrypted), 2):
		a = (ord(encrypted[i]) + ord(encrypted[i+1]) * 256) ^ g.next()
		flag += hex(a)[2:].decode('hex')

	print(flag)
