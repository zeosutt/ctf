ROT = 14

ciphertext = open('./ciphertext').read()[8:-1]

flag = 'picoCTF{'
for ch in ciphertext:
	flag += chr((ord(ch) - ord('a') + ROT) % 26 + ord('a'))
flag += '}'

print(flag)
