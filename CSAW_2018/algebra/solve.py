from sympy import *
from pwn import *

r = remote('misc.chal.csaw.io', 9002)

X = symbols('x')

r.recvuntil('*\n')

while True:
	s = r.recvline()

	log.info(s)

	left, right = s.split('=')

	log.info(eval(left))
	log.info(right)

	ans = solve(Eq(eval(left), int(right)), X)
	ans = 0 if ans == True else ans[0].evalf()

	log.info(ans)

	r.sendline(str(ans))

	log.info(r.recvline())
