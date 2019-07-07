from pwn import *
import fractions
from Crypto.Util.number import *

def crack_unknown_increment(states, modulus, multiplier):
	increment = (states[1] - states[0] * multiplier) % modulus
	return modulus, multiplier, increment

def crack_unknown_multiplier(states, modulus):
	multiplier = (states[2] - states[1]) * inverse(states[1] - states[0], modulus) % modulus
	return crack_unknown_increment(states, modulus, multiplier)

def crack_unknown_modulus(states):
	diffs = [s1 - s0 for s0, s1 in zip(states, states[1:])]
	zeroes = [t2 * t0 - t1 * t1 for t0, t1, t2 in zip(diffs, diffs[1:], diffs[2:])]
	modulus = abs(reduce(fractions.gcd, zeroes))
	return crack_unknown_multiplier(states, modulus)

while True:
	r = remote('lg.q.2019.volgactf.ru', 8801)

	r.recvuntil('Try this:\n')
	states = map(int, r.recvlines(7))

	m, a, c = crack_unknown_modulus(states)

	ok = 1
	for i in range(len(states) - 1):
		ok &= (states[i + 1] == (states[i] * a + c) % m)
	if not ok:
		r.close()
		continue

	r.sendlineafter('Predict next one!\n', str((states[-1] * a + c) % m))

	log.info(r.recvall())

	break
