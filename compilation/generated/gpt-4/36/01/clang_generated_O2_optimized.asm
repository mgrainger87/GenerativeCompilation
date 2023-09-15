	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:
	fcmp	d0, d1
	b.eq	LBB0_3
; %bb.1:
	mov	x8, #-7378697629483820647
	movk	x8, #39322
	movk	x8, #49081, lsl #48
	mov	x9, #-7378697629483820647
	movk	x9, #39322
	movk	x9, #16313, lsl #48
LBB0_2:                                 ; =>This Inner Loop Header: Depth=1
	add	w1, w1, #1
	fmov	d2, x8
	fadd	d0, d0, d2
	fmov	d2, x9
	fadd	d1, d1, d2
	fcmp	d0, d1
	b.ne	LBB0_2
LBB0_3:
	str	w1, [x2]
	str	d1, [x3]
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
