	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:
	fmov	d2, #10.00000000
	fcmp	d1, d2
	b.mi	LBB0_3
; %bb.1:
	fmov	d3, #1.00000000
	fmov	d4, #-1.00000000
LBB0_2:                                 ; =>This Inner Loop Header: Depth=1
	fadd	d0, d0, d3
	fadd	d1, d1, d4
	fcmp	d1, d2
	b.pl	LBB0_2
LBB0_3:
	str	w1, [x2]
	fmul	d0, d0, d1
	str	d0, [x3]
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
