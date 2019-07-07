encrypted = open('encrypted').read()
key = 'FLAG'

decrypted = ''
count = 0
for ch in encrypted:
	if ch.isupper():
		decrypted += chr((ord(ch) - ord(key[count % len(key)])) % 26 + ord('A'))
		count += 1
	elif ch.islower():
		decrypted += chr(((ord(ch) - ord('a')) - (ord(key[count % len(key)]) - ord('A'))) % 26 + ord('a'))
		count += 1
	else:
		decrypted += ch

# print(decrypted)
print(decrypted[decrypted.find('pico'):].splitlines()[0])
