# from z3 import *

# a, b, c, sqrt = Reals('a b c sqrt')

# s = Solver()

# s.add(a == 0x391bc2164f0a)
# s.add(a < b)
# s.add(b < c)
# s.add(c < a + b)
# s.add(sqrt ** 2 == 4.0 * a ** 2 * b ** 2 - (a ** 2 + b ** 2 - c ** 2) ** 2)
# s.add(sqrt * 0.5 / (a + b + c) == RealVal('19400354808065.543'))
# s.add(a * b * c / sqrt == RealVal('47770539528273.91'))

# s.check()

# m = s.model()

# print(m[a])
# print(m[b])
# print(m[c])

# 62791383142154
# 70802074077032.9989984808?
# 95523798483318.0132659809?

print('flag{{{:x}-{:x}-{:x}}}'.format(62791383142154, 70802074077033, 95523798483318))
