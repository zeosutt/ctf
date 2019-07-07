import sys
def F41l():
	print('Bye!!!')
	return 0
def C0rr3ct():
	print('Wow!!!You so best^_^'); return
def Ch3cking(flag):
	check = 0
	if ord(flag[0]) + 52 != ord(flag[-1]) or ord(flag[-1]) - 2 != ord(flag[7]):
		F41l(); return
	if flag[:7] != 'ISITDTU':
		sys.exit(0); return
	if flag[9] != flag[14] or flag[14] != flag[19] or flag[19] != flag[24]:
		check += 1; return
	if ord(flag[8]) != 49 or flag[8] != flag[16]:
		F41l(); return
	if flag[10:14] != 'd0nT':
		check += 1; return
	if int(flag[18]) + int(flag[23]) + int(flag[28]) != 9 or flag[18] != flag[28]:
		F41l(); return
	if flag[15] != 'L':
		check += 1; return
	if ord(flag[17]) ^ -10 != -99:
		F41l(); return
	if ord(flag[20]) + 2 != ord(flag[27]) or ord(flag[27]) > 123 or ord(flag[20]) < 97:
		check += 1; return
	if ord(flag[27]) % 100 != 0:
		F41l(); return
	if flag[25] != 'C':
		check += 1; return
	if ord(flag[26]) % 2 != 0 or ord(flag[26]) % 3 != 0 or ord(flag[26]) % 4 != 0 or not flag[26].isdigit():
		F41l(); return
	if int(flag[23]) != 3:
		check += 1; return
	if flag[22] != flag[13].lower():
		F41l(); return

	if check:
		F41l(); return
	tmp = 0
	for i in flag:
		tmp += ord(i)
	if tmp != 2441:
		F41l(); return
	C0rr3ct(); return

Ch3cking(sys.argv[1])	#  'ISITDTU{1_d0nT_L1k3_b:t3_C0d3}', 'ISITDTU{1^d0nT^L1k3^b>t3^C0d3}', ...
