	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction
	.p2align	2
_customFunction:                        
	.cfi_startproc
	; Calculate int1 * 6 and store to outInt
	mov	w8, #6
	mul	w8, w0, w8       ; Multiply int1 (x0) by 6
	str	w8, [x2]        ; Store result to outInt

	; Calculate double1 * 1.5 and store to outDouble
	fmov	d2, #1.5
	fmul	d2, d0, d2      ; Multiply double1 (d0) by 1.5
	str	d2, [x3]        ; Store result to outDouble

	ret
	.cfi_endproc
.subsections_via_symbols
