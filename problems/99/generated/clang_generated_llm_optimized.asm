	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3
lCPI0_0:
	.quad	0x3ffe666666666666              ; double 1.8999999999999999
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc

	; Calculate int1 * 9 and store it in outInt
	mov	w8, #9
	mul	w9, w0, w8
	str	w9, [x2]

	; Calculate double1 * 1.9 and store it in outDouble
	adrp	x8, lCPI0_0@PAGE
	ldr	d1, [x8, lCPI0_0@PAGEOFF]
	fmul	d0, d0, d1
	str	d0, [x3]

	ret
	.cfi_endproc
.subsections_via_symbols
