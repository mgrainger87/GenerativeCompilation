	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:
	cmp	w0, w1
	b.eq	LBB0_2
LBB0_1:                                 ; =>This Inner Loop Header: Depth=1
	add	w0, w0, #1
	sub	w1, w1, #1
	cmp	w0, w1
	b.ne	LBB0_1
LBB0_2:
	str	w0, [x2]
	str	d0, [x3]
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
