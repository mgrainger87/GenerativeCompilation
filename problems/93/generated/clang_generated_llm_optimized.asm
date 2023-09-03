	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3

lCPI0_0:
	.quad	0x3ff4cccccccccccd              ; double 1.3

	.section	__TEXT,__text,regular,pure_instructions
	.globl	_customFunction
	.p2align	2

_customFunction:                        ; @customFunction
	.cfi_startproc

; int1 + 10 and store it directly to *outInt
	add	w8, w0, #10
	str	w8, [x2]

; double1 * 1.3 and store it directly to *outDouble
	adrp	x9, lCPI0_0@PAGE
	ldr	d1, [x9, lCPI0_0@PAGEOFF]
	fmul	d0, d0, d1
	str	d0, [x3]

	ret
	.cfi_endproc
