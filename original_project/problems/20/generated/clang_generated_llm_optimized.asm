	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction
	.p2align	2
_customFunction:
	.cfi_startproc
	
	; Calculate temp1 = int1 + 3
	add	w8, w0, #3
	
	; Convert temp1 to double
	scvtf	d8, w8
	
	; Calculate temp2 = double2 + 1.0
	fmov	d9, #1.00000000
	fadd	d8, d8, d9
	fadd	d8, d8, d1
	
	; Store the result in *outDouble
	str	d8, [x3]
	
	ret
	.cfi_endproc
