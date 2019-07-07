from pubkey import P, n, e

R.<a> = GF(2 ^ 2049)

def encrypt(m, e):
    global n
    assert len(m) <= 256
    m_int = Integer(m.encode('hex'), 16)
    m_poly = P(R.fetch_int(m_int))
    c_poly = pow(m_poly, e, n)
    c_int = R(c_poly).integer_representation()
    c = format(c_int, '0256x').decode('hex')
    return c

p, q = [pi for pi, ei in n.factor()]

d = inverse_mod(e, (2 ^ p.degree() - 1) * (2 ^ q.degree() - 1))

with open('flag.enc', 'rb') as f:
    ctext = f.read()
    print(encrypt(ctext, d))
