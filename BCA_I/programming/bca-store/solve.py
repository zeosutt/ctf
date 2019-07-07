import collections

while True:
	try:
		line = input()
	except EOFError:
		break

	total = 0
	for k, v in collections.Counter(line.split()).items():
		if k == 'A':
			total -= 45 * v
		elif k == 'B':
			total -= 52 * (v - v // 2) + 52 * 0.9 * (v // 2)
		elif k == 'C':
			total -= 67 * (v - v // 2) + 67 * 0.5 * (v // 2)
		elif k == 'D':
			total -= 75 * (v - v // 3)
		else:
			total += int(k)

	if total < 0:
		print(-1)
	else:
		print('{:.2f}'.format(total))
