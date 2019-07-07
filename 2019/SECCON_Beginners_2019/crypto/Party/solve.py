from Crypto.Util.number import long_to_bytes

encrypted = eval(open('./encrypted', 'r').read())

for e in encrypted:
	print(long_to_bytes(e[1] % e[0]))
