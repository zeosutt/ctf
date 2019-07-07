import math
import re
import requests

def is_prime(n):
	i = 2
	while i * i <= n:
		if n % i == 0:
			return False
		i += 1
	return True

data = {'answer': ['' for i in range(609)]}

r = requests.post('http://7ruskc06u1n3l88-anticaptcha.labs.icec.tf/', data)

lines = [line.strip() for line in r.text.splitlines()]

print(data['answer'])

print(lines[17])

i = 0
for line in lines:
	if '<td>' in line and '</td>' in line:
		print('{:03d}: {}'.format(i, line[4:-5]))

		words = line.split()
		# print(words)

		if i == 10:
			break

		if 'following line' in line:
			ans = words[int(re.sub('[a-z]', '', words[3])) + 8].rstrip('.')
		elif 'prime number' in line:
			ans = 'true' if is_prime(int(words[1])) else 'false'
		elif 'greatest common divisor' in line:
			ans = str(math.gcd(int(words[7]), int(words[9][:-6])))
		else:
			break
		# elif 'Which planet is closest to the sun?' in line:
		# 	ans = 'Mercury'

		print(ans)
		data['answer'][i] = ans

		i += 1

print(lines[17])

print(data['answer'])



# data = {'answer': ['false' for i in range(609)], 'submit': 'Submit Answers'}

r = requests.post('http://7ruskc06u1n3l88-anticaptcha.labs.icec.tf/', data)

lines = [line.strip() for line in r.text.splitlines()]

print(lines[17])
