	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 
	.p2align	2
_customFunction:                        
	.cfi_startproc
	; Multiply double2 by 2
	fmov    d2, #2.00000000
	fmul    d2, d1, d2
	; Multiply result by 3 (since the loop iterates 3 times)
	fadd    d1, d2, d2
	fadd    d1, d1, d2
	; Store result to outDouble
	str     d1, [x3]
	; Store int1 to outInt
	str     w0, [x2]
	ret
	.cfi_endproc
.subsections_via_symbols
