	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction
	.p2align	2
_customFunction:
	.cfi_startproc

	; Calculate int1 + 2
	add	w8, w0, #2

	; Convert integer value to floating-point
	scvtf	d2, w8

	; Calculate double2 + temp
	fadd	d2, d2, d1

	; Subtract 1.0 from the result
	fmov	d3, #1.00000000
	fsub	d2, d2, d3

	; Store result in *outDouble
	str	d2, [x3]

	ret
	.cfi_endproc
