f_line = open('line_data', 'r')
f_flag = open('flag', 'w')

for line in f_line:
	if 'X' in line:
		f_flag.write('\n')
	if '07002a00020000c040' in line:
		f_flag.write(' ')
	else:
		f_flag.write('#')
