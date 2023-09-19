	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:
	mov	x8, #4632233691727265792
	fmov	d2, x8
	fcmp	d0, d2
	b.gt	LBB0_3
; %bb.1:
	mov	x8, #4632233691727265792
LBB0_2:                                 ; =>This Inner Loop Header: Depth=1
	fadd	d2, d0, d1
	fmov	d1, x8
	fcmp	d2, d1
	fmov	d1, d0
	fmov	d0, d2
	b.le	LBB0_2
LBB0_3:
	fmov	d0, #5.00000000
	fadd	d0, d1, d0
	str	d0, [x3]
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
