import json
import collections

data = json.load(open('vt_minute_output.json', 'r'))

sha256s = []

for record in data:
	if record['times_submitted'] > 1:
		additional_info = record['additional_info']
		if 'pe-resource-list' in additional_info:
			for sha256 in additional_info['pe-resource-list'].keys():
				sha256s.append(sha256)

count = collections.Counter(sha256s)

print(count)
