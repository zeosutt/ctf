instructions = ['cadadddddr', 'caddadddddr', 'caadddddr', 'caddadddddr', 'cadddddddddddddddddddadddddr', 'cadddddadddddr', 'caaddddddr', 'cadddddddddddadddr', 'cadadr', 'cadddddadr', 'cadddddddadr', 'caddddaddddr', 'caddddddddadr', 'caddddadr', 'cadddddadr', 'cadddadr', 'cadddadddddr', 'caddddaddddr', 'cadddddddddddddddadddddr', 'cadddddddddddddddddadddr', 'caadr', 'caddddddadddddr', 'cadddddddddddddddddadddr', 'caddddadr', 'caddddddddddddadddr', 'caddddddddddddadddddr', 'cadadr', 'cadddddddddddddadddddr', 'caddddddadddr', 'caddddaddddr', 'cadadr', 'cadddddadr', 'caddddaddddr', 'caddddadr', 'caddddddddddddddddddddddadddddr', 'cadddadr', 'caddddddddddddddddddadddr', 'caadr', 'caddddddddddddadddr', 'caddddadddddr', 'cadar', 'caddaddddddr']
printables = [' !"#$%&\'()*+,-./', '0123456789', ':;<=>?@', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', '[\\]^_`', 'abcdefghijklmnopqrstuvwxyz', '{|}~']

flag = ''
for inst in instructions:
	inst = inst[-2:0:-1]
	assert(inst.count('a') == 2)

	i = inst.find('a')
	j = len(inst) - i - 2

	flag += printables[i][j]

print(flag)
