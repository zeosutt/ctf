ciphertext = open('./ciphertext').read()
s_table = 'rpchlwoxasnkdgbiuemjzqyfvt'

plaintext = ''.join(s_table[ord(ch) - ord('a')] if ch.islower() else ch for ch in ciphertext)

# print(plaintext)
print(plaintext[plaintext.find('flag - ')+7:].splitlines()[0])
