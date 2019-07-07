import json

data = json.load(open('vt_minute_output.json', 'r'))

class Counter:
	def __init__(self):
		self.num_appear = 0
		self.num_detected = 0
		self.percent = None

	def __str__(self):
		return '{}/{} ({})'.format(self.num_detected, self.num_appear, self.percent)

	def appear(self):
		self.num_appear += 1
		self.update_percent()

	def detected(self):
		self.num_detected += 1
		self.update_percent()

	def update_percent(self):
		self.percent = self.num_detected / self.num_appear

cnt = {}

for record in data:
	for name, result in record['scans'].items():
		if name not in cnt:
			cnt[name] = Counter()

		cnt[name].appear()
		if result['detected']:
			cnt[name].detected()

cnt_sorted = sorted(cnt.items(), key=lambda x: x[1].percent, reverse=True)

for key, item in cnt_sorted:
	print(key, item)
