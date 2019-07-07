import string
from pwn import *

characters = string.digits + string.ascii_letters + string.punctuation

def find_flag():
	init = 'A' * 11 + 'fying code is: '
	flag = 'picoCTF{'

	while True:
		for ch in characters:
			r = remote('2018shell1.picoctf.com', 37131)

			r.sendlineafter('report: ', (init + flag + ch)[-27:] + 'A' * (16 - len(flag) % 16))
			cypher = r.recvline()
			r.close()

			start = (len(flag) / 16 + 7) * 32
			if cypher[128:160] == cypher[start:start+32]:
				flag += ch
				log.info('progress: {}'.format(flag))
				if ch == '}':
					return flag
				break

print(find_flag())

# picoCTF{@g3nt6_1$_th3_c00l3$t_2432504}
