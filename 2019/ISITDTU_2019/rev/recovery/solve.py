class Node:
	def __init__(self, num):
		self.num = num
		self.left = None
		self.right = None

root = None
def insert(num):
	global root

	node = Node(num)

	if root is None:
		root = node
		return

	parent = None
	current = root
	while current is not None:
		parent = current
		if num < current.num:
			current = current.left
		else:
			current = current.right

	if num < parent.num:
		parent.left = node
	else:
		parent.right = node

def pre_order(node):
	if node is None:
		return []

	ret = [node.num]
	ret.extend(pre_order(node.left))
	ret.extend(pre_order(node.right))
	return ret

l = [35, 33, 44, 40, 38, 48, 11, 85, 89, 61, 110, 150, 159, 135, 188, 200, 180, 106, 101, 214, 268, 275, 269, 253, 241, 201, 9, 301, 301, 285, 327, 356, 363, 396, 413, 399, 445, 434, 462, 449, 428, 471, 481, 492, 496, 497, 476, 381, 358, 278, 534, 526, 520, 613, 599, 623, 621, 621, 589, 540, 628, 650, 653, 652, 665, 691, 679, 711, 756, 752, 722, 716, 807, 786, 773, 771, 826, 808, 827, 764, 856, 875, 867, 842, 836, 708, 879, 892, 889, 922, 877, 951, 946, 658, 980, 996, 993, 965, 634, 509]

for num in l[::-1]:
	insert(num)

print('ISITDTU{' + str(pre_order(root))[1:-1] + '}')
