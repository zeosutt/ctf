from Crypto.Util.number import *
import Crypto.PublicKey.RSA as RSA

c = 77361455127455996572404451221401510145575776233122006907198858022042920987316
p = 299681192390656691733849646142066664329
q = 324144336644773773047359441106332937713
e = 65537

n = p * q
d = inverse(e, (p - 1) * (q - 1))
rsa = RSA.construct((n, e, d))

print(long_to_bytes(rsa.decrypt(c)))
