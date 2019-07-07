import math
import base64

base64_chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'

with open('./cipher.txt') as f:
	print(base64.b64decode(''.join([base64_chars[int(math.log2(x))-1] for x in eval(f.read())])))
