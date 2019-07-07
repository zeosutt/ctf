import base64
import zlib

encrypted = open('./encrypted.txt', 'r').read()

for i in range(500):
	encrypted = base64.b64decode(encrypted)
	encrypted = zlib.decompress(encrypted)

print(encrypted)
