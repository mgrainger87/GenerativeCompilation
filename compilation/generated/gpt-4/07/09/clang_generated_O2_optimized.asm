	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:
	add	w8, w0, w0, lsl #1
	sub	w8, w8, w1
	str	w8, [x2]
	fmov	d2, #-3.00000000
	fmadd	d0, d1, d2, d0
	str	d0, [x3]
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
