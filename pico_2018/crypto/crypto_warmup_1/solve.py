ciphertext = 'llkjmlmpadkkc'
key = 'thisisalilkey'

flag = ''.join(chr((ord(ch) - ord(key[i % len(key)])) % 26 + ord('A')) for i, ch in enumerate(ciphertext))

print('picoCTF{{{}}}'.format(flag))
