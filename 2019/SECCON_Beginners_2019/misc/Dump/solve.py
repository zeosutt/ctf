import subprocess

data = ''.join(map(lambda x: chr(int(x, 8)), open('./flag_hexdumped').read().split()))
open('./flag.tar.gz', 'wb').write(data)
subprocess.call(['tar', '-xf', './flag.tar.gz'])
