def to_digits(exp, num):
	digits = []
	while num > 0:
		digits.append(num % exp)
		num /= exp
	return digits


def determine_exp(num):
	num += 100000

	candidates = []
	for exp in range(3, 1000):
		digits = to_digits(exp, num)
		if reduce(lambda f, d: f and (d == 0 or d == 1), digits[-100:], True):
			candidates.append(exp)

	assert len(candidates) == 1

	return candidates[0]

def decrypt(exp, num):
	num += 100000

	digits = to_digits(exp, num)

	valid_len = len(digits) / 8 * 8 - 512
	msg = ''.join(map(str, digits[-valid_len:]))

	return hex(int(msg[::-1], 2))[2:].rstrip('L').decode('hex')

encrypted = open('flag.enc', 'rb').read()
msg = int(encrypted.encode('hex'), 16)

# exp = determine_exp(msg)
exp = 3
decrypted = decrypt(exp, msg)

f = open('flag.png', 'w')
f.write(decrypted)
f.close()

