	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:
	mul	w8, w1, w0
	add	w9, w1, w0
	cmp	w0, #10
	csel	w8, w8, w9, gt
	str	w8, [x2]
	fmov	d2, #5.00000000
	fcmp	d1, d2
	fcsel	d0, d0, d1, mi
	str	d0, [x3]
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols