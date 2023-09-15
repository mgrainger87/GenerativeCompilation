	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:
	str	xzr, [x3]
	cmp	w0, #1
	b.lt	LBB0_9
; %bb.1:
	cmp	w0, #4
	b.hs	LBB0_3
; %bb.2:
	mov	w8, #0
	movi	d1, #0000000000000000
	b	LBB0_6
LBB0_3:
	and	w8, w0, #0xfffffffc
	movi	d1, #0000000000000000
	mov	x9, x8
LBB0_4:                                 ; =>This Inner Loop Header: Depth=1
	fadd	d1, d1, d0
	fadd	d1, d1, d0
	fadd	d1, d1, d0
	fadd	d1, d1, d0
	subs	w9, w9, #4
	b.ne	LBB0_4
; %bb.5:
	cmp	w8, w0
	b.eq	LBB0_8
LBB0_6:
	sub	w8, w0, w8
LBB0_7:                                 ; =>This Inner Loop Header: Depth=1
	fadd	d1, d1, d0
	subs	w8, w8, #1
	b.ne	LBB0_7
LBB0_8:
	str	d1, [x3]
LBB0_9:
	str	wzr, [x2]
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
