	.intel_syntax noprefix
	.text
	.globl	convert_upper
	.type	convert_upper, @function
	.globl	convert_lower
	.type	convert_lower, @function

convert_upper:
	mov        eax, edi
	lea        ecx, dword [eax-0x34]
	mov        edx, 0x4ec4ec4f
	mov        eax, ecx
	imul       edx
	sar        edx, 0x3
	mov        eax, ecx
	sar        eax, 0x1f
	sub        edx, eax
	mov        eax, edx
	imul       eax, eax, 0x1a
	sub        ecx, eax
	mov        eax, ecx
	add        eax, 0x41
	ret


convert_lower:
	mov        eax, edi
	lea        ecx, dword [eax-0x54]
	mov        edx, 0x4ec4ec4f
	mov        eax, ecx
	imul       edx
	sar        edx, 0x3
	mov        eax, ecx
	sar        eax, 0x1f
	sub        edx, eax
	mov        eax, edx
	imul       eax, eax, 0x1a
	sub        ecx, eax
	mov        eax, ecx
	add        eax, 0x61
	ret
