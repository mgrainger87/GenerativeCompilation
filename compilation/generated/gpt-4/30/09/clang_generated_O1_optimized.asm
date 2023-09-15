	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:
	str	xzr, [x3]
	fcvtzs	w8, d1
	mul	w9, w8, w0
	cmp	w8, #0
	csel	w8, w9, wzr, gt
	sub	w8, w1, w8
	str	w8, [x2]
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
