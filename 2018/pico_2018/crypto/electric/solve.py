from pwn import *

def xor(s1, s2):
	return ''.join(chr(ord(ch1) ^ ord(ch2)) for ch1, ch2 in zip(s1, s2))

r = remote('2018shell1.picoctf.com', 15037)

dummy_file = 'A' * 29
r.sendlineafter('Please choose: ', 'n')
r.sendlineafter('Name of file? ', dummy_file)
r.sendlineafter('Data? ', '')
r.recvuntil('Share code:\n')
code = r.recvline().strip().decode('base64')

key = xor(dummy_file, code)

r.sendlineafter('Please choose: ', 'i')
r.recvuntil('flag')
flag_file = 'flag' + r.recvline().strip()

encrypted = xor(flag_file, key)

r.sendlineafter('Please choose: ', 'e')
r.sendlineafter('Share code? ', encrypted.encode('base64'))

r.recvuntil('Data: \n')
print(r.recvline())

r.close()
