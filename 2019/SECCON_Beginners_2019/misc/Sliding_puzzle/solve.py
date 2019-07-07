from pwn import *
import subprocess

r = remote('133.242.50.201', 24912)

for i in range(100):
	r.recvuntil('----------------\n')
	args = ['./solve'] + ''.join(r.recvlines(3)).replace('|', '').split()
	ans = ','.join(subprocess.check_output(args).split()[::-1])
	r.sendlineafter('----------------\n', ans)

r.interactive()
