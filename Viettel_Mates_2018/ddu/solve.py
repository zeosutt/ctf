import base64
from pwn import *

challenge = raw_input('challenge: ')

r = remote('ec2-13-251-81-16.ap-southeast-1.compute.amazonaws.com', 3333)

r.sendlineafter('Your choice: ', '1')

answer = ''
for i in xrange(len(challenge) / 4):
	for ch in xrange(128):
		r.sendlineafter('Your message: ', answer + chr(ch))
		r.recvuntil('The cipher text: ')
		if base64.b64decode(r.recvline())[-4:] == challenge[i*4:i*4+4]:
			answer += chr(ch)
			break
	log.info(answer)
