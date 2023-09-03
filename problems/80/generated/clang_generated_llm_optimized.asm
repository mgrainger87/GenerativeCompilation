	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction
	.p2align	2
_customFunction:
	.cfi_startproc
	; Load 2.0 once
	fmov	d1, #2.00000000
	; Multiply double1 with 2.0
	fmul	d0, d0, d1
	; Store the result in outDouble
	str	d0, [x3]
	; Return
	ret
	.cfi_endproc
.subsections_via_symbols
