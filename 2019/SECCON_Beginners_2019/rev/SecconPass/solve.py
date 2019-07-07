encrypted = '\x54\x4d\x51\x0d\x55\x42\x7e\x54\x47\x55\x04\x54\x04\x57\x43\x0a\x53\x66\x75\x40\x68\x7a\x47\x08\x42\x0c\x47\x08\x42\x0c\x6d'
key = 'A' + chr(ord(encrypted[1]) ^ ord('t')) + 'A' + chr(ord(encrypted[0]) ^ ord('c'))

flag = ''
for i in range(len(encrypted)):
	if i % 2 == 0:
		flag += chr(ord(encrypted[i]) ^ ord(key[3]))
	else:
		flag += chr(ord(encrypted[i]) ^ ord(key[1]))

print(flag)
