encrypted = open('ciphertext').read()

decrypted = ''
for ch in encrypted:
	if ch.islower():
		decrypted += chr((ord(ch) - ord('a') + 24) % 26 + ord('A'))
	else:
		decrypted += chr((ord(ch) + 0x3c))

print(decrypted)
