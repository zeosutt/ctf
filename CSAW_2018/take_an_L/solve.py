from pwn import *

r = remote('misc.chal.csaw.io', 9000)

def tile(x1, x2, y1, y2, tx, ty):
	point_str = []
	for i in range(2):
		for j in range(2):
			if x1 + i != tx or y1 + j != ty:
				point_str.append('({},{})'.format(x1 + i, y1 + j))
	r.sendline(','.join(point_str))

def solve(x1, x2, y1, y2, tx, ty):
	if x2 - x1 == 2:
		tile(x1, x2, y1, y2, tx, ty)
		return

	mx = (x1 + x2) / 2
	my = (y1 + y2) / 2

	if tx < mx:
		if ty < my:
			tile(mx - 1, mx + 1, my - 1, my + 1, mx - 1, my - 1)
			solve(x1, mx, y1, my, tx, ty)
			solve(mx, x2, y1, my, mx, my - 1)
			solve(x1, mx, my, y2, mx - 1, my)
			solve(mx, x2, my, y2, mx, my)
		else:
			tile(mx - 1, mx + 1, my - 1, my + 1, mx - 1, my)
			solve(x1, mx, y1, my, mx - 1, my - 1)
			solve(mx, x2, y1, my, mx, my - 1)
			solve(x1, mx, my, y2, tx, ty)
			solve(mx, x2, my, y2, mx, my)
	else:
		if ty < my:
			tile(mx - 1, mx + 1, my - 1, my + 1, mx, my - 1)
			solve(x1, mx, y1, my, mx - 1, my - 1)
			solve(mx, x2, y1, my, tx, ty)
			solve(x1, mx, my, y2, mx - 1, my)
			solve(mx, x2, my, y2, mx, my)
		else:
			tile(mx - 1, mx + 1, my - 1, my + 1, mx, my)
			solve(x1, mx, y1, my, mx - 1, my - 1)
			solve(mx, x2, y1, my, mx, my - 1)
			solve(x1, mx, my, y2, mx - 1, my)
			solve(mx, x2, my, y2, tx, ty)

r.recvuntil('marked block: ')

tx, ty = map(int, r.recvline().strip()[1:-1].split(','))

solve(0, 64, 0, 64, tx, ty)

r.interactive()
