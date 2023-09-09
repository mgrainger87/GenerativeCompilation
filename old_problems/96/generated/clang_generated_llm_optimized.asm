	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3
lCPI0_0:
	.quad	0x3ff999999999999a              ; double 1.6000000000000001

	.section	__TEXT,__text,regular,pure_instructions
	.globl	_customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:
	mov	w8, #7
	mul	w8, w1, w8
	str	w8, [x2]

	adrp	x8, lCPI0_0@PAGE
	ldr	d0, [x8, lCPI0_0@PAGEOFF]
	fmul	d0, d1, d0
	str	d0, [x3]

	ret
	.cfi_endproc
