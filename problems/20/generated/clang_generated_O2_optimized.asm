	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:
	add	w8, w0, #3
	fmov	d0, #1.50000000
	fadd	d0, d1, d0
	fmov	d1, #-0.50000000
	fadd	d0, d0, d1
	scvtf	d1, w8
	fadd	d0, d0, d1
	str	d0, [x3]
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
