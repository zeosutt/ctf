import math
import random
import requests
import subprocess

bits = [random.randint(0, 1) for _ in range(512)]
data_req = {'basis': [random.choice('+x') for _ in range(512)], 'qubits': []}
for bit, base in zip(bits, data_req['basis']):
	rad = math.pi / 4 * ((bit << 1) + (base == 'x'))
	c = complex(1, 0) * complex(math.cos(rad), math.sin(rad))
	data_req['qubits'].append({'real': c.real, 'imag': c.imag})

r = requests.post('http://cryptoqkd.web.ctfcompetition.com/qkd/qubits', json=data_req)

data_res = r.json()

shared_key = ''
for bit, base_req, base_res in zip(bits, data_req['basis'], data_res['basis']):
	if base_req == base_res:
		shared_key += str(bit)
shared_key = shared_key[:128]

encryption_key = hex(int(shared_key, 2) ^ int(data_res['announcement'], 16))[2:-1]

with open('./key', 'wb') as f:
	f.write(encryption_key.decode('hex'))

flag = 'U2FsdGVkX19OI2T2J9zJbjMrmI0YSTS+zJ7fnxu1YcGftgkeyVMMwa+NNMG6fGgjROM/hUvvUxUGhctU8fqH4titwti7HbwNMxFxfIR+lR4='
cmd = 'echo "{}" | openssl aes-256-cbc -d -pbkdf2 -md sha1 -base64 --pass file:./key'.format(flag)
subprocess.call(cmd, shell=True)
