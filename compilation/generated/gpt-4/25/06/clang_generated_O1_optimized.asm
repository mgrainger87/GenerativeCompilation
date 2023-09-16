	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:
	str	d0, [x3]
	cmp	w0, #1
	b.lt	LBB0_3
LBB0_1:                                 ; =>This Inner Loop Header: Depth=1
	fsub	d0, d0, d1
	subs	w0, w0, #1
	b.ne	LBB0_1
; %bb.2:
	str	d0, [x3]
LBB0_3:
	str	wzr, [x2]
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
