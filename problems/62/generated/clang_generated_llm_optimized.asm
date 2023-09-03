	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction
	.p2align	2
_customFunction:
	.cfi_startproc

	; Add int1 and int2, and store the result at *outInt
	add	w8, w0, w1
	str	w8, [x2]

	; Multiply double1 by 4.0 and store the result at *outDouble
	fmov	d2, #4.0
	fmul	d0, d0, d2
	str	d0, [x3]

	ret
	.cfi_endproc
