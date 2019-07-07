encrypted = ''
with open('./main', 'rb') as f:
	f.seek(0x858)
	encrypted = f.read(0x19)
key = "You have now entered the Duck Web, and you're in for a honkin' good time.\nCan you figure out my trick?"

flag = ''.join(chr(ord(ch1) ^ ord(ch2)) for ch1, ch2 in zip(encrypted, key))

print(flag)
