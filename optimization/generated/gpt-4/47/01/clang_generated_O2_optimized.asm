	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:
	fmov	d2, #0.50000000
LBB0_1:                                 ; =>This Inner Loop Header: Depth=1
	sub	w8, w0, w1
	fadd	d3, d0, d1
	fmov	d0, d1
	fmul	d1, d3, d2
	mov	x0, x1
	mov	x1, x8
	cmp	w8, #11
	b.lt	LBB0_1
; %bb.2:
	str	d1, [x3]
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
