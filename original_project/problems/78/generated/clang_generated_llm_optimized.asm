	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction
	.p2align	2
_customFunction:                
	.cfi_startproc

	; Subtract the two doubles
	fsub	d8, d0, d1

	; Store the result in *outDouble for the first iteration
	str	d8, [x3]

	; No need for the second iteration since the result is the same

	ret
	.cfi_endproc
.subsections_via_symbols
