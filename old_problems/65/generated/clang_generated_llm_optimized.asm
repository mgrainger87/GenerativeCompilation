	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction
	.p2align	2
_customFunction:
	.cfi_startproc

	; Multiply double1 by 5
	fmov	d2, #5.0
	fmul	d0, d0, d2

	; Store int2 to *outInt
	str	w1, [x2]

	; Store result to *outDouble
	str	d0, [x3]

	ret
	.cfi_endproc
