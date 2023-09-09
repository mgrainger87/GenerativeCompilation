	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:
	subs	w8, w1, #1
	b.eq	LBB0_2
LBB0_1:                                 ; =>This Inner Loop Header: Depth=1
	lsl	w0, w0, #1
	subs	w8, w8, #1
	b.ne	LBB0_1
LBB0_2:
	str	w0, [x2]
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
