import csv

rows = []

with open('blink.csv', 'r') as f:
	reader = csv.reader(f)

	for i in range(21):
		next(reader)

	bef = []
	for row in reader:
		if row[1:] != bef[1:]:
			rows.append(row)
		bef = row

with open('blink_uniqed.csv', 'w') as f:
	writer = csv.writer(f)
	writer.writerows(rows)
