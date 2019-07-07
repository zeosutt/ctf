with open('./decoded', 'rb') as f:
	data = f.read()
	print(''.join([chr(byte ^ 0xff) for byte in data]))
