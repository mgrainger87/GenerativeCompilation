	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:
	cmp	w1, #5
	b.lt	LBB0_7
; %bb.1:
	subs	w8, w1, #6
	csel	w8, wzr, w8, lo
	add	w8, w8, #1
	cmp	w8, #6
	b.lo	LBB0_5
; %bb.2:
	lsr	w8, w8, #1
	add	w8, w8, #1
	and	w9, w8, #0x7ffffffc
	sub	w1, w1, w9, lsl #1
	fmov	d2, #-1.00000000
	mov	x10, x9
LBB0_3:                                 ; =>This Inner Loop Header: Depth=1
	fadd	d1, d1, d2
	fadd	d1, d1, d2
	fadd	d1, d1, d2
	fadd	d1, d1, d2
	subs	w10, w10, #4
	b.ne	LBB0_3
; %bb.4:
	cmp	w8, w9
	b.eq	LBB0_7
LBB0_5:
	add	w8, w1, #2
	fmov	d2, #-1.00000000
LBB0_6:                                 ; =>This Inner Loop Header: Depth=1
	fadd	d1, d1, d2
	sub	w8, w8, #2
	cmp	w8, #7
	b.hs	LBB0_6
LBB0_7:
	str	w0, [x2]
	fadd	d0, d1, d0
	str	d0, [x3]
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
