import os
from flag import flag


class Stream:
    A = 37423
    B = 61781
    C = 34607
    def __init__(self, seed):
        self.seed = seed % self.C

    def __iter__(self):
        return self

    def next(self):
        self.seed = (self.A * self.seed + self.B) % self.C
        return self.seed

g = Stream(int(os.urandom(8).encode('hex'), 16))

encrypted = ''
for i in range(0, len(flag), 2):
    a = int(flag[i:i+2].encode('hex'), 16) ^ g.next()
    encrypted += chr(a % 256)
    encrypted += chr(a / 256)

open('encrypted', 'wb').write(encrypted)
