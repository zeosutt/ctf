from pwn import *

# determined = '67ced5346146c105075443add26fd7efd7276'
determined = '67ced5346146c105075443add26fd7efd72763dd'
# s1 = '0123456789abcdef':
s1 = '3'

offset = len(determined) + 29

def check(ch1, s2):
	r = remote('crypto.chal.ctf.westerns.tokyo', 14791)

	target = r.recvline()[10+offset:]
	r.recvline()

	for ch2 in s2:
		for ch3 in '0123456789abcdef':
			flag = 'TWCTF{' + determined + ch1 + ch2 + ch3
			flag += '0' * (46 - len(flag)) + '}'
			r.sendline(flag)

			encrypted = r.recvline()[15+offset:]

			if target[:3] == encrypted[:3]:
				log.info(ch1 + ch2 + ch3)

	r.close()

for ch1 in s1:
	log.info(ch1)

	# check(ch1, '012345')
	# check(ch1, '6789ab')
	# check(ch1, 'cdef')
	check(ch1, 'd')
