from z3 import *

A = [[[0x758, 0x2c0, 0x808, 0x306],
      [0x251, 0x116, 0x2c9, 0x144],
      [0x5f7, 0x2d5, 0x3d7, 0x298],
      [0x88a, 0x2bf, 0xa86, 0x347]],
     [[0x14f, 0x6e8, 0x6db, 0x69b],
      [0x3ae, 0x403, 0x3ff, 0x6fd],
      [0x2f6, 0x515, 0x4fa, 0x6fa],
      [0x30c, 0x310, 0x26c, 0x540]],
     [[0x4ab, 0x3d4, 0x47c, 0x56f],
      [0x58a, 0x4ec, 0x32b, 0x3f1],
      [0x556, 0x486, 0x3cb, 0x481],
      [0x42c, 0x2e0, 0x3a4, 0x348]],
     [[0x798, 0x3ef, 0x5a0, 0x3d2],
      [0x4ad, 0x127, 0x585, 0x15e],
      [0x622, 0x385, 0x53a, 0x382],
      [0x3ae, 0x2d0, 0x24a, 0x2b1]],
     [[0x3ca, 0x5a7, 0x567, 0x8b1],
      [0x089, 0x48b, 0x538, 0x488],
      [0x15c, 0x505, 0x533, 0x4fd],
      [0x120, 0x2ca, 0x291, 0x2df]],
     [[0x534, 0x5c0, 0x24c, 0x4b4],
      [0x1f7, 0x289, 0x06e, 0x199],
      [0x4af, 0x2d5, 0x375, 0x2b8],
      [0x671, 0x7f0, 0x180, 0x535]]]

X = [[[BitVec('X{}_{}_{}'.format(k, i, j), 32) for j in range(4)] for i in range(4)] for k in range(3)]

s = Solver()

for k in range(3):
	for i in range(4):
		for j in range(4):
			s.add(X[k][i][j] >= 0, X[k][i][j] < 36)

s.add(X[0][0][0] == ord('A') - ord('A') + 10)
s.add(X[0][0][1] == ord('S') - ord('A') + 10)
s.add(X[0][0][2] == ord('I') - ord('A') + 10)
s.add(X[0][0][3] == ord('S') - ord('A') + 10)
s.add(X[0][1][0] == 0)
s.add(X[2][3][3] == 0)

# X0 * X1 = A0
for i in range(4):
	for j in range(4):
		s.add(X[0][i][0]*X[1][0][j] + X[0][i][1]*X[1][1][j] + X[0][i][2]*X[1][2][j] + X[0][i][3]*X[1][3][j] + (i+j)*4 == A[0][i][j])

# X1 * X0 = A1
for i in range(4):
	for j in range(4):
		s.add(X[1][i][0]*X[0][0][j] + X[1][i][1]*X[0][1][j] + X[1][i][2]*X[0][2][j] + X[1][i][3]*X[0][3][j] + (i+j)*4 == A[1][i][j])

# X1 * X2 = A2
for i in range(4):
	for j in range(4):
		s.add(X[1][i][0]*X[2][0][j] + X[1][i][1]*X[2][1][j] + X[1][i][2]*X[2][2][j] + X[1][i][3]*X[2][3][j] + (i+j)*4 == A[2][i][j])

# X2 * X1 = A3
for i in range(4):
	for j in range(4):
		s.add(X[2][i][0]*X[1][0][j] + X[2][i][1]*X[1][1][j] + X[2][i][2]*X[1][2][j] + X[2][i][3]*X[1][3][j] + (i+j)*4 == A[3][i][j])

# X2 * X0 = A4
for i in range(4):
	for j in range(4):
		s.add(X[2][i][0]*X[0][0][j] + X[2][i][1]*X[0][1][j] + X[2][i][2]*X[0][2][j] + X[2][i][3]*X[0][3][j] + (i+j)*4 == A[4][i][j])

# X0 * X2 = A5
for i in range(4):
	for j in range(4):
		s.add(X[0][i][0]*X[2][0][j] + X[0][i][1]*X[2][1][j] + X[0][i][2]*X[2][2][j] + X[0][i][3]*X[2][3][j] + (i+j)*4 == A[5][i][j])

s.check()
m = s.model()

flag = ''
for k in range(3):
	for i in range(4):
		for j in range(4):
			x = m[X[k][i][j]].as_long()
			if x < 10:
				flag += chr(ord('0') + x)
			else:
				flag += chr(ord('A') + x - 10)
flag = flag[0:4] + '{' + flag[5:16] + '_' + flag[16:32] + '_' + flag[32:47] + '}'

print(flag)
