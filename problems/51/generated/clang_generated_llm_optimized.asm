	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction
	.p2align	2
_customFunction:
	.cfi_startproc

	; Multiply int1 (x0) by 8 (4 + 4)
	lsl	x0, x0, #3
	; Store result to *outInt
	str	x0, [x2]

	; Multiply double2 (d1) by 16 (8 + 8)
	fmov	d2, #16.00000000
	fmul	d1, d1, d2
	; Store result to *outDouble
	str	d1, [x3]

	ret
	.cfi_endproc
