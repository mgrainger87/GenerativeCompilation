	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:
	fcmp	d1, #0.0
	b.eq	LBB0_3
; %bb.1:
	fmov	d2, #1.00000000
	fmov	d3, #-1.00000000
LBB0_2:                                 ; =>This Inner Loop Header: Depth=1
	fadd	d0, d0, d2
	fadd	d1, d1, d3
	fcmp	d1, #0.0
	b.ne	LBB0_2
LBB0_3:
	str	d0, [x3]
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
