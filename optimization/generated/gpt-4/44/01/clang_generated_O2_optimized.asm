	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:
	subs	w8, w0, #10
	b.lt	LBB0_2
; %bb.1:
	mov	w9, #19
	cmp	w0, #19
	csel	w9, w0, w9, lt
	sub	w9, w0, w9
	add	w9, w9, #9
	mov	w10, #52429
	movk	w10, #52428, lsl #16
	umull	x9, w9, w10
	lsr	x9, x9, #35
	sub	w10, w9, #1
	mul	x10, x9, x10
	lsr	x10, x10, #1
	mov	w11, #-10
	add	w12, w1, w0
	madd	w8, w9, w8, w12
	madd	w1, w10, w11, w8
LBB0_2:
	lsl	w8, w1, #1
	str	w8, [x2]
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
