	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction
	.p2align	2

_customFunction:
	.cfi_startproc

	; var1 = int1 * 2
	lsl	w8, w0, #1  ; w8 holds var1

	; var2 = int2 * 3
	mov	w9, #3
	mul	w9, w1, w9  ; w9 holds var2, though it's not used in the function

	; *outInt = int1 + int2
	add	w10, w0, w1
	str	w10, [x2]

	; *outDouble = double1 + double2
	fadd	d3, d0, d1  ; d3 holds the addition result
	str	d3, [x3]

	ret
	.cfi_endproc

.subsections_via_symbols
