print(''.join([chr(sorted([(lambda s: sum(map(ord, s)) // len(s))(open('bigdata/OUT/{}/{}'.format(i, j)).read()) for j in range(100)])[50]) for i in range(27)]))
