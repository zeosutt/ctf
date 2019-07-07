import json

data = json.load(open('vt_minute_output.json', 'r'))

TARGET_SSDEEP = '98304:Jz+dL13cDAY46LqrVmndsYMPq0EzbVcB14wj1vj7jSmvd:Jz+dL13c74oqhmndVMC0Ey1dtjiK'

for record in data:
	mx = record['scans']['MAX']
	if mx['detected']:
		print(record['ssdeep'])
		print(record['md5'])
