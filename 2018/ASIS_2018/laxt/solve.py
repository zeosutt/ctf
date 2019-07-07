import itertools
import hashlib
from pwn import *

def proof_of_work_sha1(target):
	log.info('PoW target: ' + target)
	for chs in itertools.product(string.ascii_letters, repeat=5):
		s = ''.join(chs)
		if hashlib.sha1(s).hexdigest()[-6:] == target:
			r.sendline(s)
			return True
	return False

def solve(n):
	if '0' in n or '1' not in n:
		return False

	n = ''.join(sorted(n, reverse=True))
	n_without_1 = n[:-1]

	for _ in range(101):
		r.recvuntil('equal to ')
		target = int(r.recvline())

		log.info('laxt target: ' + str(target))

		mx = 0
		mx_exp = ''
		for nums in itertools.combinations_with_replacement(n_without_1, 2):
			exp = '*'.join(nums)
			val = eval(exp)
			if val <= target and val > mx:
				mx = val
				mx_exp = exp
		for nums in itertools.combinations_with_replacement(n_without_1, 3):
			exp = '*'.join(nums)
			val = eval(exp)
			if val <= target and val > mx:
				mx = val
				mx_exp = exp

		ans = mx_exp

		rem = target - mx
		while rem > 0:
			for num in n:
				if int(num) <= rem:
					rem -= int(num)
					ans += '+' + num
					break

		non_used_num = ''.join(set(n) - set(ans.translate(None, '*+')))
		if non_used_num != '':
			ans += '+' + non_used_num + '%1'

		log.info(ans)

		if len(ans) > 18:
			return False

		r.sendline(ans)

	return True


while True:
	r = remote('37.139.4.247', 19153)

	r.recvuntil('such that ')
	algo = r.recvuntil('(X)')[:-3]
	target = r.recvline().strip()[-6:]

	if algo != 'sha1' or not proof_of_work_sha1(target):
		r.close()
		continue

	r.sendlineafter('[C]ontinue to solve', 'C')

	r.recvuntil('n = ')
	n = r.recvline().strip()
	log.info('n: ' + n)

	if not solve(n):
		r.close()
		continue

	break

r.interactive()
