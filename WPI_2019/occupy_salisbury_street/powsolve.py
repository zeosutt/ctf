#!/usr/bin/env python
import hashlib
import sha3
import string
import itertools
import sys

#challenge  = "wpictf2019powygbY9ImCke:6:02dca9fcf7aabd06d309e8e5e218a40a5c7fb9240ddc4620f06fae31081e5725"
challenge = sys.argv[1]


prec = challenge.split(':')[0]
diff = int(challenge.split(':')[1])
sash = challenge.split(':')[2]




base = hashlib.sha3_256()
base.update(prec.encode("utf-8"))

for t in itertools.product(string.ascii_lowercase, repeat=diff):
	sham = "".join(t)
	m = base.copy()
	m.update(sham.encode("utf-8"))
	if sash == m.hexdigest():
		print ('answer is')
		print(prec + sham)
		break


#shammy = prec + ''.join(random.choices(string.ascii_uppercase + string.digits, k=N))
