with open('one.txt') as f1, open('two.txt') as f2:
	data1 = [int(x, 16) for x in f1.read().split()]
	data2 = [int(x, 16) for x in f2.read().split()]
	print(''.join([chr(d1 + d2) for d1, d2 in zip(data1, data2)]))
