import csv
from PIL import Image

image = Image.new('RGB', (128, 64))

with open('./blink_uniqed.csv', 'r') as f:
	reader = csv.DictReader(f, ['time', 'OE', 'LAT', 'CLK', 'E', 'D', 'C', 'B', 'A', 'B2', 'B1', 'G2', 'G1', 'R2', 'R1'])

	for i in range(4):
		next(reader)

	reg = {'rgb1': [], 'rgb2': []}
	frame = 0

	bef = {'time': '', 'OE': '', 'LAT': '', 'CLK': '', 'E': '', 'D': '', 'C': '', 'B': '', 'A': '', 'B2': '', 'B1': '', 'G2': '', 'G1': '', 'R2': '', 'R1': ''}
	for row in reader:
		if row['CLK'] == '1' and bef['CLK'] == '0':
			reg['rgb1'].append((int(row['R1']) * 255, int(row['G1']) * 255, int(row['B1']) * 255))
			reg['rgb2'].append((int(row['R2']) * 255, int(row['G2']) * 255, int(row['B2']) * 255))

		if row['LAT'] == '0' and bef['LAT'] == '1':
			section = int(row['E'] + row['D'] + row['C'] + row['B'] + row['A'], 2)
			for x in range(128):
				image.putpixel((x, section), reg['rgb1'][x])
				image.putpixel((x, section + 32), reg['rgb2'][x])

			reg = {'rgb1': [], 'rgb2': []}

		if row['OE'] == '0' and bef['OE'] == '1':
			image.save('./frame{:03}.png'.format(frame))
			frame += 1

		bef = row
