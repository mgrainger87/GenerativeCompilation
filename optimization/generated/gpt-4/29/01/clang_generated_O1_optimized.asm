	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:
	lsl	w8, w0, #3
	sub	w8, w8, w0
	str	w8, [x2]
	fmov	d1, #5.00000000
	fmul	d1, d0, d1
	fmov	d2, #2.00000000
	fmadd	d0, d0, d2, d1
	str	d0, [x3]
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
