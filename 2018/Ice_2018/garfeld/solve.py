key = [0, 7, 2, 7, 1, 9, 7, 8]
encoded = 'IjgJUO{P_LOUV_AIRUS_GYQUTOLTD_SKRFB_TWNKCFT}'

FLAG = ''

i = 0
for ch in encoded:
	if not str.isalpha(ch):
		FLAG += ch
		continue
	elif str.isupper(ch):
		FLAG += chr((ord(ch) - ord('A') - key[i] + 26) % 26 + ord('A'))
	elif str.islower(ch):
		FLAG += chr((ord(ch) - ord('a') - key[i] + 26) % 26 + ord('a'))
	i = (i + 1) % len(key)

print(FLAG)
