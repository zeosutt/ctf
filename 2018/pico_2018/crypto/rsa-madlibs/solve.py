from pwn import *
from Crypto.Util.number import *
import Crypto.PublicKey.RSA as RSA

r = remote('2018shell1.picoctf.com', 40440)


# context.log_level = 'debug'


r.recvuntil('q : ')
q = int(r.recvline())
r.recvuntil('p : ')
p = int(r.recvline())

r.sendlineafter('IS THIS POSSIBLE and FEASIBLE? (Y/N):', 'Y')

r.sendlineafter('n: ', str(p * q))



r.recvuntil('p : ')
p = int(r.recvline())
r.recvuntil('n : ')
n = int(r.recvline())

r.sendlineafter('IS THIS POSSIBLE and FEASIBLE? (Y/N):', 'Y')

r.sendlineafter('q: ', str(n / p))



r.sendlineafter('IS THIS POSSIBLE and FEASIBLE? (Y/N):', 'N')



r.sendlineafter('IS THIS POSSIBLE and FEASIBLE? (Y/N):', 'Y')

r.sendlineafter('totient(n): ', str(6256003596))



r.recvuntil('plaintext : ')
plaintext = int(r.recvline())
r.recvuntil('e : ')
e = int(r.recvline())
r.recvuntil('n : ')
n = int(r.recvline())

r.sendlineafter('IS THIS POSSIBLE and FEASIBLE? (Y/N):', 'Y')

r.sendlineafter('ciphertext: ', str(pow(plaintext, e, n)))



r.sendlineafter('IS THIS POSSIBLE and FEASIBLE? (Y/N):', 'N')



r.recvuntil('q : ')
q = int(r.recvline())
r.recvuntil('p : ')
p = int(r.recvline())
r.recvuntil('e : ')
e = int(r.recvline())

r.sendlineafter('IS THIS POSSIBLE and FEASIBLE? (Y/N):', 'Y')

r.sendlineafter('d: ', str(inverse(e, (p - 1) * (q - 1))))



r.recvuntil('p : ')
p = int(r.recvline())
r.recvuntil('ciphertext : ')
ciphertext = int(r.recvline())
r.recvuntil('e : ')
e = int(r.recvline())
r.recvuntil('n : ')
n = int(r.recvline())

q = n / p
d = inverse(e, (p - 1) * (q - 1))

r.sendlineafter('IS THIS POSSIBLE and FEASIBLE? (Y/N):', 'Y')

plaintext = str(pow(ciphertext, d, n))
r.sendlineafter('plaintext: ', plaintext)



# r.interactive()



log.info(plaintext)
log.info(long_to_bytes(plaintext))


