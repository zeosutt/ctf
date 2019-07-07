from pwn import *

r = remote('2018shell1.picoctf.com', 64706)

r.recvuntil('Please give me the ')
r.sendline(''.join(chr(int(b, 2)) for b in r.recvline().split()[:-3]))

r.recvuntil('Please give me the ')
r.sendline(r.recvuntil(' ')[:-1].decode('hex'))

r.recvuntil('Please give me the  ')
r.sendline(''.join(chr(int(o, 8)) for o in r.recvline().split()[:-3]))

r.recvuntil("You got it! You're super quick!\n")
print(r.recvline()[6:-1])
