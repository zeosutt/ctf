from pwn import *
import sympy

context.log_level = 'debug'

r = remote('zerois-o-reiwa.seccon.jp', 23615)

for i in range(100):
	r.recvuntil(']\n')
	s = r.recvline().strip().split('=')
	x = sympy.Symbol('x')
	a = sympy.solve(eval(s[1].replace('?', 'x')))
	try:
		r.sendline(str(a[0]))
	except Exception:
		r.sendline('0')

r.interactive()
