import string
import subprocess

PIN_DIR = '~/Desktop/tool/pin-3.7-97619-g0d0c92f4f-gcc-linux'
INSCOUNT_DIR = '{}/source/tools/ManualExamples/obj-ia32'.format(PIN_DIR)
CMD = '{}/pin -t {}/inscount0.so -- ./future_fun'.format(PIN_DIR, INSCOUNT_DIR)

# flag = b'flag{g00d_th1ng5_f0r_w41ting}'
flag = b''
while True:
	mx = {'cnt': 0, 'ch': b'\x00'}
	for ch in string.ascii_lowercase + string.digits + '{_}':
		ch = ch.encode()

		subprocess.run(CMD, shell=True, stdout=subprocess.DEVNULL, input=flag+ch)
		with open('inscount.out') as f:
			cnt = int(f.read().split()[1])
			if cnt > mx['cnt']:
				mx['cnt'] = cnt
				mx['ch'] = ch

	flag += mx['ch']
	print('{} ({})'.format(flag.decode(), mx['cnt']))

	if mx['ch'] == b'}':
		break
