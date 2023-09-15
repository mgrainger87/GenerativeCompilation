	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:
	str	xzr, [x3]
	cmp	w0, #1
	b.lt	LBB0_4
; %bb.1:
	movi	d1, #0000000000000000
LBB0_2:                                 ; =>This Inner Loop Header: Depth=1
	fadd	d1, d1, d0
	subs	w0, w0, #1
	b.ne	LBB0_2
; %bb.3:
	str	d1, [x3]
LBB0_4:
	str	wzr, [x2]
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
