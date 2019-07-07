from pwn import *

r = remote('crypto.chal.csaw.io', 8041)

suffix = ''
# suffix = 'rime_doesnt_have_a_logo'

while True:
	length = {}

	for ch in string.ascii_lowercase + '_':
		suffix_cand = ch + suffix

		if suffix_cand == 'gogo':
			continue

		while True:
			try:
				r.sendlineafter('Encrypting service\n', suffix_cand * (0x100 // len(suffix_cand)))
				s = r.recvline().strip()
				break
			except EOFError:
				r.close()
				while True:
					try:
						r = remote('crypto.chal.csaw.io', 8041)
						break
					except:
						pass

		length[suffix_cand] = ord(s[-1])

	mn = sorted(length.values())[0]

	shortests = []
	for key, value in length.items():
		if value == mn:
			shortests.append(key)

	if len(shortests) > 1:
		log.info(shortests)
		break

	suffix = shortests[0]

	log.info(suffix)

r.close()
