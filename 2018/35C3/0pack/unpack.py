with open('./0pack.elf', 'rb') as f:
	buf = bytearray(f.read())

for i in range(0x752):
	buf[0x127b0 + i] = buf[0x18000 + i] ^ 0x4e

for i in range(0x7):
	buf[0x12f10 + i] = buf[0x1c000 + i] ^ 0x77

for i in range(0x10):
	buf[0x14048 + i] = buf[0x1d000 + i] ^ 0x29

with open('./0pack_unpacked.elf', 'wb') as f:
	f.write(buf)
