encrypted = open('./flag.txt.encrypted', 'rb').read()
key = 'cur10us4ndl0ngh0stn4m3'[::-1]

flag = ''
for i, ch in enumerate(encrypted):
	flag += chr(ord(ch) ^ ord(key[i % len(key)]))

print(flag)
