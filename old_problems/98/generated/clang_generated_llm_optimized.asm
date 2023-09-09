	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3

lCPI0_0:
	.quad	0x3ffccccccccccccd              ; double 1.8

	.section	__TEXT,__text,regular,pure_instructions
	.globl	_customFunction
	.p2align	2

_customFunction:                        ; @customFunction
	.cfi_startproc

	; Calculate int2 - 15 and store the result directly to *outInt
	subs	w8, w1, #15
	str	w8, [x2]

	; Multiply double2 by 1.8 and store the result directly to *outDouble
	adrp	x8, lCPI0_0@PAGE
	ldr	d2, [x8, lCPI0_0@PAGEOFF]
	fmul	d0, d1, d2
	str	d0, [x3]

	ret
	.cfi_endproc
