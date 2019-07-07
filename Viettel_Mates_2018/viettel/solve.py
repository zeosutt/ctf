from pwn import *

r = remote('13.251.110.215', 10001)

r.sendlineafter('4. Exit', '2')
r.sendlineafter('Item ID: ', '5')

r.recvuntil('Your order:\n')
payment = r.recvline()

sp = payment.rfind('&sign=')

sign = payment[sp+6:-1]
payment = payment[:sp]

for i in xrange(8, 33):
	hashpump = process('./hashpump')

	hashpump.sendlineafter('Input Signature: ', sign)
	hashpump.sendlineafter('Input Data: ', payment)
	hashpump.sendlineafter('Input Key Length: ', str(i))
	hashpump.sendlineafter('Input Data to Add: ', '&price=0')

	s = hashpump.recvlines(2)

	hashpump.close()

	r.sendlineafter('4. Exit', '3')
	r.sendlineafter('Your order:', eval('"' + s[1].strip() + '"') + '&sign=' + s[0].strip())

	s = r.recvuntil('1. Phone list')
	if 'Good job!' in s:
		log.info(s)
		break
