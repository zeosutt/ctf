from pwn import *
import hashlib
import itertools
import string

def pow(hashlib_f, target):
	for t in itertools.product(string.ascii_letters, repeat=6):
		s = ''.join(t)
		if hashlib_f(s).hexdigest()[-6:] == target:
			return s

def solve_crc32(l):
	return 'ASIS{' + '0' * (l - 10)	+ 'RQ_-}', 'ASIS{' + '0' * (l - 11)	+ 'a0031}'

# context.log_level = 'debug'

while True:
	r = remote('37.139.9.232', 19199)

	s = r.recvline().split()

	algo = s[-3]
	target = s[-1]

	if 'md5' in algo:
		ans = pow(hashlib.md5, target)
	else:
		r.close()
		continue

	r.sendline(ans)

	for i in range(15):
		r.recvuntil('len = ')
		s = r.recvline().split()

		ans = solve_crc32(int(s[0]))

		r.sendline('({}, {})'.format(ans[0], ans[1]))

	r.interactive()

	break
