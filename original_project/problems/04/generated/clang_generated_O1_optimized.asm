	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:
	lsl	w8, w0, #1
	str	w8, [x2]
	mov	x8, #-9223372036854775808
	fmov	d2, x8
	fmadd	d0, d1, d2, d0
	fadd	d0, d0, d0
	str	d0, [x3]
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
