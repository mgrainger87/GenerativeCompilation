	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction
	.p2align	2
_customFunction:                        
	.cfi_startproc
	; Save int2 (w1) to the address in x2 (outInt)
	str	w1, [x2]

	; Save double1 (d0) to the address in x3 (outDouble)
	str	d0, [x3]

	ret
	.cfi_endproc
.subsections_via_symbols
