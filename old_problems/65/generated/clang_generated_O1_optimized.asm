	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:
	movi	d1, #0000000000000000
	mov	w8, #5
LBB0_1:                                 ; =>This Inner Loop Header: Depth=1
	fadd	d1, d1, d0
	subs	w8, w8, #1
	b.ne	LBB0_1
; %bb.2:
	str	w1, [x2]
	str	d1, [x3]
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
