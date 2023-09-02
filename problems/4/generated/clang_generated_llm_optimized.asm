	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction
	.p2align	2
_customFunction:
	.cfi_startproc

	; For integer operation
	lsl	w8, w0, #1                ; Multiply int1 by 2
	str	w8, [x2]                  ; Store the result to outInt
	
	; For double operation
	fmov	d1, #2.00000000
	fmul	d0, d0, d1                ; Multiply double1 by 2.0
	str	d0, [x3]                  ; Store the result to outDouble

	ret
	.cfi_endproc
.subsections_via_symbols
