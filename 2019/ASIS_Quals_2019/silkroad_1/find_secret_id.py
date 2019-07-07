from z3 import *

l = 9

x = BitVec('x', 32)
d = [BitVec('d{}'.format(i), 32) for i in range(9)]

s = Solver()

s.add(x >= 10 ** (l - 1))
s.add(x < 10 ** l)
s.add(x % (l + 2) == 0)

for i in range(9):
    s.add(d[i] == x / 10 ** i % 10)


s.add(d[l - 5] == 1)
s.add((d[3] * 10 + d[1]) - (d[8] * 10 + d[5]) == 1)
s.add((d[7] * 10 + d[6]) - (d[1] * 10 + d[2]) * 2 == 8)
s.add((d[5] * 10 + d[7]) / (d[2] * 10 + d[0]) == 3)
s.add((d[5] * 10 + d[7]) % (d[2] * 10 + d[0]) == 0)
s.add(x % ((x / 100000) * (x % 10000)) == (l + 2) ** 3 + 6)

s.check()
m = s.model()

print(m[x].as_long())
