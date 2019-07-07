import subprocess

def rule126(left, center, right):
	return '0' if left == center == right else '1'

def apply_rule(before, rule):
	return ''.join([rule(before[i-1], before[i], before[(i+1) % len(before)]) for i in range(len(before))])

def _generate_key_cands(template, pos):
	if pos == len(template):
		if apply_rule(template, rule126) == obtained:
			return [template]
		else:
			return []

	if template[pos] == '.':
		return _generate_key_cands(template[:pos] + '0' + template[pos+1:], pos + 1) + _generate_key_cands(template[:pos] + '1' + template[pos+1:], pos + 1)
	else:
		return _generate_key_cands(template, pos + 1)

def generate_key_cands(template):
	return _generate_key_cands(template, 0)

obtained = '{:064b}'.format(0x66de3c1bf87fdfcf)
key_cand_templates = [
	'00111100011101000001100000001110...10000001.....10001...10000110',
	'00111100011101000001100000001110...10000001.....10001...01111010',
	'00111100011101000001100000001110...10000001.....01110...10000110',
	'00111100011101000001100000001110...10000001.....01110...01111010',
	'00111100011101000001100000001110...01111110.....10001...10000110',
	'00111100011101000001100000001110...01111110.....10001...01111010',
	'00111100011101000001100000001110...01111110.....01110...10000110',
	'00111100011101000001100000001110...01111110.....01110...01111010',
	'00111100011101000001011111110001...10000001.....10001...10000110',
	'00111100011101000001011111110001...10000001.....10001...01111010',
	'00111100011101000001011111110001...10000001.....01110...10000110',
	'00111100011101000001011111110001...10000001.....01110...01111010',
	'00111100011101000001011111110001...01111110.....10001...10000110',
	'00111100011101000001011111110001...01111110.....10001...01111010',
	'00111100011101000001011111110001...01111110.....01110...10000110',
	'00111100011101000001011111110001...01111110.....01110...01111010',
	'00111100011100111110100000001110...10000001.....10001...10000110',
	'00111100011100111110100000001110...10000001.....10001...01111010',
	'00111100011100111110100000001110...10000001.....01110...10000110',
	'00111100011100111110100000001110...10000001.....01110...01111010',
	'00111100011100111110100000001110...01111110.....10001...10000110',
	'00111100011100111110100000001110...01111110.....10001...01111010',
	'00111100011100111110100000001110...01111110.....01110...10000110',
	'00111100011100111110100000001110...01111110.....01110...01111010',
	'00111100011100111110011111110001...10000001.....10001...10000110',
	'00111100011100111110011111110001...10000001.....10001...01111010',
	'00111100011100111110011111110001...10000001.....01110...10000110',
	'00111100011100111110011111110001...10000001.....01110...01111010',
	'00111100011100111110011111110001...01111110.....10001...10000110',
	'00111100011100111110011111110001...01111110.....10001...01111010',
	'00111100011100111110011111110001...01111110.....01110...10000110',
	'00111100011100111110011111110001...01111110.....01110...01111010',
	'11000011100011000001100000001110...10000001.....10001...10000101',
	'11000011100011000001100000001110...10000001.....10001...01111001',
	'11000011100011000001100000001110...10000001.....01110...10000101',
	'11000011100011000001100000001110...10000001.....01110...01111001',
	'11000011100011000001100000001110...01111110.....10001...10000101',
	'11000011100011000001100000001110...01111110.....10001...01111001',
	'11000011100011000001100000001110...01111110.....01110...10000101',
	'11000011100011000001100000001110...01111110.....01110...01111001',
	'11000011100011000001011111110001...10000001.....10001...10000101',
	'11000011100011000001011111110001...10000001.....10001...01111001',
	'11000011100011000001011111110001...10000001.....01110...10000101',
	'11000011100011000001011111110001...10000001.....01110...01111001',
	'11000011100011000001011111110001...01111110.....10001...10000101',
	'11000011100011000001011111110001...01111110.....10001...01111001',
	'11000011100011000001011111110001...01111110.....01110...10000101',
	'11000011100011000001011111110001...01111110.....01110...01111001',
	'11000011100010111110100000001110...10000001.....10001...10000101',
	'11000011100010111110100000001110...10000001.....10001...01111001',
	'11000011100010111110100000001110...10000001.....01110...10000101',
	'11000011100010111110100000001110...10000001.....01110...01111001',
	'11000011100010111110100000001110...01111110.....10001...10000101',
	'11000011100010111110100000001110...01111110.....10001...01111001',
	'11000011100010111110100000001110...01111110.....01110...10000101',
	'11000011100010111110100000001110...01111110.....01110...01111001',
	'11000011100010111110011111110001...10000001.....10001...10000101',
	'11000011100010111110011111110001...10000001.....10001...01111001',
	'11000011100010111110011111110001...10000001.....01110...10000101',
	'11000011100010111110011111110001...10000001.....01110...01111001',
	'11000011100010111110011111110001...01111110.....10001...10000101',
	'11000011100010111110011111110001...01111110.....10001...01111001',
	'11000011100010111110011111110001...01111110.....01110...10000101',
	'11000011100010111110011111110001...01111110.....01110...01111001',
]

key_cands = []
for key_cand_template in key_cand_templates:
	key_cands += generate_key_cands(key_cand_template)

for key_cand in key_cands:
	with open('./key', 'wb') as f:
		f.write('{:016x}'.format(int(key_cand, 2)).decode('hex'))

	flag = 'U2FsdGVkX1/andRK+WVfKqJILMVdx/69xjAzW4KUqsjr98GqzFR793lfNHrw1Blc8UZHWOBrRhtLx3SM38R1MpRegLTHgHzf0EAa3oUeWcQ='
	cmd = 'echo "{}" | openssl aes-256-cbc -d -pbkdf2 -md sha1 -base64 --pass file:./key 2> /dev/null'.format(flag)

	try:
		decrypted = subprocess.check_output(cmd, shell=True)
		if 'CTF{' in decrypted:
			print(decrypted)
			break
	except:
		pass