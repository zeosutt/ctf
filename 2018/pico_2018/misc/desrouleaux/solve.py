from pwn import *
import collections
import json

with open('./incidents.json') as f:
	tickets = json.load(f)['tickets']

r = remote('2018shell1.picoctf.com', 14079)

while True:
	r.recvlines(3)
	s = r.recvline()

	if 'What is the most common source' in s:
		r.sendline(collections.Counter([ticket['src_ip'] for ticket in tickets]).most_common()[0][0])
	elif 'How many unique destination' in s:
		addr = s.split()[-1][:-1]
		r.sendline(str(len(set([ticket['dst_ip'] for ticket in tickets if ticket['src_ip'] == addr]))))
	elif 'What is the average number of unique destination' in s:
		tickets_by_hash = {}
		for ticket in tickets:
			tickets_by_hash.setdefault(ticket['file_hash'], []).append(ticket)

		nums = [len(set([ticket['dst_ip'] for ticket in tickets])) for tickets in tickets_by_hash.values()]
		r.sendline(str(float(sum(nums)) / len(nums)))
	elif 'picoCTF' in s:
		print(s[s.find('picoCTF'):])
		break
