with open('flag.txt') as f:
	indices = map(int, f.readline().split())
	lines = [l.strip() for l in f.readlines()]

viable_lines = filter(lambda l: len(l) % 3 == 0 and '&' not in l, lines)

print(''.join([l[i-1] for l, i in zip(viable_lines, indices)]))
