	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:
	fcmp	d0, #0.0
	cneg	w8, w1, ne
	add	w8, w8, w0
	fmov	d1, #1.00000000
	fcsel	d0, d1, d0, eq
	str	w8, [x2]
	str	d0, [x3]
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
