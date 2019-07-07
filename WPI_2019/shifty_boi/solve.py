reg = [1, 1, 1, 1, 1, 1]
hint = [0xbc, 0x1c, 0x56, 0x06, 0xab, 0xb5, 0x61, 0xa0, 0xe2, 0x8b, 0x55, 0xed, 0x74, 0xdd, 0x2f, 0x60]

output = []
for i in range(8 * 93):
	next_reg = [reg[1], reg[2], reg[3], reg[4], reg[5], reg[1] ^ reg[4]]
	reg = next_reg
	output.append(reg[0])

decoded = hex(int(''.join(map(str, output)), 2))[2:-1].decode('hex')

print(repr(decoded))
# print(repr(hex(int(''.join(map(str, reversed(output))), 2))[2:-1].decode('hex')))
# print(hex(int(''.join(map(str, output)), 2))[2:-1].decode('hex'))

for i in range(0, len(output), 248):
	print(output[i:i+248])


print(repr(chr(ord(decoded[0]) ^ ord('W'))))

a = [1, 2, 5, 4]
print(a[0:1])
