	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:
	mov	x8, #4632233691727265792
	fmov	d2, x8
	fcmp	d1, d2
	b.gt	LBB0_3
; %bb.1:
	fmov	d2, #10.00000000
	fmov	d3, #-2.00000000
	fmov	d4, #2.00000000
	mov	x8, #4632233691727265792
	fmov	d5, #5.00000000
LBB0_2:                                 ; =>This Inner Loop Header: Depth=1
	fcmp	d1, d2
	fcsel	d6, d4, d3, mi
	fcsel	d7, d5, d2, mi
	fadd	d0, d0, d6
	fadd	d1, d1, d7
	fmov	d6, x8
	fcmp	d1, d6
	b.le	LBB0_2
LBB0_3:
	str	d0, [x3]
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
