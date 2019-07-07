import sys
from z3 import *

cipher, chalbox = eval(open(sys.argv[1], 'r').read())

length, gates, check = chalbox

b = Bools(' '.join([str(i) for i in range(check[0] + 1)]))

s = Solver()

size = length
for name, args in gates:
    if name == 'true':
        s.add(b[size] == True)
    else:
        u1 = Xor(b[args[0][0]], args[0][1])
        u2 = Xor(b[args[1][0]], args[1][1])
        if name == 'or':
            s.add(b[size] == Or(u1, u2))
        elif name == 'xor':
            s.add(b[size] == Xor(u1, u2))

    size += 1

s.add(Xor(b[check[0]], check[1]) == True)

s.check()

m = s.model()
print(int(''.join(['1' if is_true(m[b[i]]) else '0' for i in range(length)])[::-1], 2))
