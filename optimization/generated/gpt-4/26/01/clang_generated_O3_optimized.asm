	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:
	add	w8, w0, w0, lsl #1
	lsl	w8, w8, #1
	str	w8, [x2]
	fmov	d1, #5.00000000
	fmadd	d1, d0, d1, d0
	fadd	d1, d1, d0
	fadd	d0, d1, d0
	str	d0, [x3]
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
