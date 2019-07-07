import binascii
import itertools
import string
import sys

usable_chars = string.digits + string.ascii_letters + '_-'

l = int(sys.argv[1])
assert(l >= 7)

i = 0
d = {}
for t in itertools.product(usable_chars, repeat=l-6):
	s = 'ASIS{' + ''.join(t) + '}'
	crc32 = binascii.crc32(s)
	if crc32 in d:
		print(d[crc32], s)
		break
	d[crc32] = s

	i += 1
	if i % 100000 == 0:
		print(i)
