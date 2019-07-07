import string
from random import *
import itertools

def caesar_cipher(x, y):
    y = y * (len(x) / len(y) + 1)
    return ''.join((chr(ord(i) ^ ord(j)) for i, j in itertools.izip(x, y)))


f = open('./FlagDCTF.pdf', 'r')
buf = f.read()
f.close()
allchar = string.ascii_letters + string.punctuation + string.digits
password = ''.join((choice(allchar) for _ in range(randint(60, 60))))
buf = caesar_cipher(buf, password)
f = open('./youfool!.exe', 'w')
buf = f.write(buf)
f.close()
