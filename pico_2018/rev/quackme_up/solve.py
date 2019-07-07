def rol(ch, n):
	return (ch << n | ch >> 8 - n) & 0xff

def ror(ch, n):
	return (ch >> n | ch << 8 - n) & 0xff

encrypted = ''
with open('./main', 'rb') as f:
	f.seek(0x820)
	encrypted = ''.join(chr(int(x, 16)) for x in f.read(0x4a).split())

flag = ''.join(chr(ror(rol(ord(ch), 8) ^ 0x16, 4)) for ch in encrypted)

print(flag)
