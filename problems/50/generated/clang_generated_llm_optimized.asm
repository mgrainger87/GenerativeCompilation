	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
	; %bb.0:

	; int multiplication by (1/3) always results in 0 for integer values.
	mov	w8, #0
	str	w8, [x2]   ; store 0 to outInt

	; Multiply double1 by 0.25
	fmov	d1, #0.25000000
	fmul	d0, d0, d1
	str	d0, [x3]   ; store result to outDouble

	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
