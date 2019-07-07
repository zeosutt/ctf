#!/usr/bin/python

from Crypto.Util.number import *
from flag import FLAG, round

def encrypt(msg):
    assert set(msg) == set(['0', '1'])
    enc = [msg[i:i+2] + str(int(msg[i]) ^ int(msg[min(i+1, len(msg)-1)])) for i in range(0, len(msg), 2)]
    print(enc)
    return ''.join(enc)

def decrypt(enc):
    assert set(enc) == set(['0', '1'])
    msg = [enc[i:i+2] if i+3 <= len(enc) else enc[i] for i in range(0, len(enc), 3)]
    # print(msg)
    return ''.join(msg)


# ENC = bin(bytes_to_long(FLAG))[2:]

# print(ENC)

# for _ in xrange(round):
#     ENC = encrypt(ENC)

# fp = open('FLAG.enc', 'w')
# fp.write(long_to_bytes(int(ENC, 2)))
# fp.close()

fp = open('_FLAG.enc', 'r')
ENC = fp.read()
print(ENC)
ENC = bin(bytes_to_long(ENC))[2:]
print(ENC)
fp.close()


for _ in xrange(round):
    ENC = decrypt(ENC)
    print(long_to_bytes(int(ENC, 2)))
