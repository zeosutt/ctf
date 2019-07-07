from pwn import *

context.log_level = 'error'

for ch1 in string.ascii_letters + string.digits:
	for ch2 in string.ascii_letters + string.digits:
		flag = 'TWCTF{base64_rot13_' + ch1 + ch2 + '}'
		p = process(['dec_dec_dec', flag])
		try:
			if p.recvline().strip() == 'correct  :)':
				print(flag)
		except EOFError:
			pass
		p.close()
