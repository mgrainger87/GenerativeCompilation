	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:
	mul	w8, w0, w0
	mul	w9, w1, w1
	mov	w10, #43691
	movk	w10, #43690, lsl #16
	mov	w11, #43690
	movk	w11, #10922, lsl #16
	madd	w10, w1, w10, w11
	mov	w11, #1431655765
	cmp	w10, w11
	csel	w8, w8, w9, lo
	str	w8, [x2]
	fadd	d2, d0, d1
	fcmp	d0, d1
	movi	d0, #0000000000000000
	fcsel	d0, d0, d2, eq
	str	d0, [x3]
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
