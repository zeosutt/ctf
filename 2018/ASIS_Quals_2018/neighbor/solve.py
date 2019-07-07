from pwn import *
import hashlib
from decimal import *

context.log_level = 'debug'

def challenge(chal):
	ans = ''
	for c1 in string.ascii_letters:
		for c2 in string.ascii_letters:
			for c3 in string.ascii_letters:
				for c4 in string.ascii_letters:
					for c5 in string.ascii_letters:
						s = c1 + c2 + c3 + c4 + c5
						if hashlib.sha256(s).hexdigest()[-6:] == chal:
							return s

r = remote('37.139.22.174', 11740)

r.recvuntil('sha256(X)[-6:] = ')
chal = r.recv(6)

log.info(chal)

r.sendline(challenge(chal))

getcontext().prec = 2000

while True:
	r.recvuntil('n = ')

	n = Decimal(r.recvline())

	log.info(n)

	ans = n
	for i in xrange(2, 100):
		a = n ** (Decimal(1) / Decimal(i))
		b = a.quantize(Decimal(1), rounding=ROUND_FLOOR)
		c = b ** Decimal(i)
		diff = n - c
		if diff < ans:
			ans = diff
			log.info('{:.10f} ({})'.format(diff.log10(), i))

	r.sendline(str(ans))
