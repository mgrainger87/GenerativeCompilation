	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:
	cmp	w0, w1
	b.ne	LBB0_2
; %bb.1:
	mul	w8, w1, w0
	str	w8, [x2]
	fadd	d0, d0, d1
	str	d0, [x3]
	ret
LBB0_2:
	str	wzr, [x2]
	movi	d0, #0000000000000000
	str	d0, [x3]
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
