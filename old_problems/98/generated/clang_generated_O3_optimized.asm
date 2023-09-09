	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:
	sub	w8, w1, #15
	str	w8, [x2]
	mov	x8, #-3689348814741910324
	movk	x8, #52429
	movk	x8, #16380, lsl #48
	fmov	d0, x8
	fmul	d0, d1, d0
	str	d0, [x3]
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
