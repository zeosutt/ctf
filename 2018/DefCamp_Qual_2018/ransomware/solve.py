import string
from random import *
import itertools

def caesar_cipher(x, y):
    y = y * (len(x) / len(y) + 1)
    return ''.join((chr(ord(i) ^ ord(j)) for i, j in itertools.izip(x, y)))


f = open('./youfool!.exe', 'r')
buf = f.read()
f.close()

# print(chr(ord(buf[0x00]) ^ ord('%')))
# print(chr(ord(buf[0x01]) ^ ord('P')))
# print(chr(ord(buf[0x02]) ^ ord('D')))
# print(chr(ord(buf[0x03]) ^ ord('F')))
# print(chr(ord(buf[0x04]) ^ ord('-')))
# print(chr(ord(buf[0x05]) ^ ord('1')))
# print(chr(ord(buf[0x06]) ^ ord('.')))
# print(chr(ord(buf[0x07]) ^ ord('5')))
# print(chr(ord(buf[0x08]) ^ ord('\x0a')))
# print(chr(ord(buf[0x09]) ^ ord('%')))
# print(chr(ord(buf[0x0e]) ^ ord('\x0a')))
# print(chr(ord(buf[0x100]) ^ ord('r')))
# print(chr(ord(buf[0x107]) ^ ord('e')))
# print(chr(ord(buf[0x108]) ^ ord('D')))
# print(chr(ord(buf[0x109]) ^ ord('e')))
# print(chr(ord(buf[0x10a]) ^ ord('c')))
# print(chr(ord(buf[0x10b]) ^ ord('o')))
# print(chr(ord(buf[0x10c]) ^ ord('d')))
# print(chr(ord(buf[0x10d]) ^ ord('e')))
# print(chr(ord(buf[0x22d]) ^ ord('j')))
# print(chr(ord(buf[0x2a3]) ^ ord('g')))
# print(chr(ord(buf[0x2c2]) ^ ord('/')))
# print(chr(ord(buf[0x2c3]) ^ ord('F')))
# print(chr(ord(buf[0x2c4]) ^ ord('l')))
# print(chr(ord(buf[0x2da]) ^ ord('t')))
# print(chr(ord(buf[0x2db]) ^ ord('h')))
# print(chr(ord(buf[0x2db]) ^ ord('h')))
# print(chr(ord(buf[0x342]) ^ ord('/')))
# print(chr(ord(buf[0x343]) ^ ord('C')))
# print(chr(ord(buf[0x344]) ^ ord('o')))
# print(chr(ord(buf[0x576]) ^ ord('e')))
# print(chr(ord(buf[0x577]) ^ ord('c')))
# print(chr(ord(buf[0x578]) ^ ord('o')))
# print(chr(ord(buf[0x579]) ^ ord('d')))
# print(chr(ord(buf[0x57a]) ^ ord('e')))
# print(chr(ord(buf[0x2505]) ^ ord('/')))
# print(chr(ord(buf[0x2506]) ^ ord('C')))
# print(chr(ord(buf[0x2507]) ^ ord('o')))
# print(chr(ord(buf[0x259e]) ^ ord('/')))
# print(chr(ord(buf[0x259f]) ^ ord('I')))
# print(chr(ord(buf[0x25a0]) ^ ord('m')))
# print(chr(ord(buf[0x25a1]) ^ ord('a')))
# print(chr(ord(buf[0x25a6]) ^ ord('/')))
# print(chr(ord(buf[0x25a7]) ^ ord('I')))
# print(chr(ord(buf[0x2792]) ^ ord('/')))
# print(chr(ord(buf[0x2793]) ^ ord('P')))
# print(chr(ord(buf[0x27a8]) ^ ord('a')))
# print(chr(ord(buf[0x27a9]) ^ ord('g')))
# print(chr(ord(buf[0x2926]) ^ ord('/')))
# print(chr(ord(buf[0x2927]) ^ ord('F')))
# print(chr(ord(buf[0x2928]) ^ ord('l')))
# print(chr(ord(buf[0x2929]) ^ ord('a')))
# print(chr(ord(buf[0x29e9]) ^ ord('e')))
# print(chr(ord(buf[0x29ec]) ^ ord('s')))
# print(chr(ord(buf[0x29ed]) ^ ord('t')))
# print(chr(ord(buf[0x2a1c]) ^ ord('\x0a')))
# print(chr(ord(buf[0x2a1d]) ^ ord('%')))
# print(chr(ord(buf[0x2a1e]) ^ ord('%')))
# print(chr(ord(buf[0x2a1f]) ^ ord('E')))
# print(chr(ord(buf[0x2a20]) ^ ord('O')))
# print(chr(ord(buf[0x2a21]) ^ ord('F')))
# print(chr(ord(buf[0x2a22]) ^ ord('\x0a')))

# allchar = string.ascii_letters + string.punctuation + string.digits
# print(allchar)
password = ':P-@uSL"Y1K$[X)fg[|".45Yq9i>eV)<0C:(\'q4nP[hGd/EeX+E7,2O"+:[2'
l = len(password)
# print(len(password))
password += '\x00' * (60 - len(password))
# print(len(password))
# print(password)
buf = caesar_cipher(buf, password)
# print(buf)
f = open('./FlagDCTF.pdf', 'w')
f.write(buf)
f.close()

# print(len(buf))

b = password[::-1].find(' ')
l = password.find(' ')
for i in range(0, len(buf), 60):
	print('{:x}-{:x}: {}{}'.format(i-b, i+l-1, buf[i-b:i], buf[i:i+l]))