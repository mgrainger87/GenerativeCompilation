	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:
	fmov	d1, #10.00000000
	fcmp	d0, d1
	b.ge	LBB0_3
; %bb.1:
	fmov	d2, #2.00000000
LBB0_2:                                 ; =>This Inner Loop Header: Depth=1
	add	w1, w1, #1
	fadd	d0, d0, d2
	fcmp	d0, d1
	b.lt	LBB0_2
LBB0_3:
	add	w8, w1, w0
	str	w8, [x2]
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
