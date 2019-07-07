import string
from z3 import *

valid_chars = string.digits + string.ascii_uppercase

a = Ints('0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15')

s = Solver()

for i in range(16):
	s.add(a[i] >= 0, a[i] < 36)

s.add((a[0] + a[1]) % 36 == 14)
s.add((a[2] + a[3]) % 36 == 24)
s.add((a[2] - a[0]) % 36 == 6)
s.add((a[1] + a[3] + a[5]) % 36 == 4)
s.add((a[2] + a[4] + a[6]) % 36 == 13)
s.add((a[3] + a[4] + a[5]) % 36 == 22)
s.add((a[6] + a[8] + a[10]) % 36 == 31)
s.add((a[1] + a[4] + a[7]) % 36 == 7)
s.add((a[9] + a[12] + a[15]) % 36 == 20)
s.add((a[13] + a[14] + a[15]) % 36 == 12)
s.add((a[8] + a[9] + a[10]) % 36 == 27)
s.add((a[7] + a[12] + a[13]) % 36 == 23)

s.check()

m = s.model()
print(''.join(valid_chars[m[a[i]].as_long()] for i in range(16)))
