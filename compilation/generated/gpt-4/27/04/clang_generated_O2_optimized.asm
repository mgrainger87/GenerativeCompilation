	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:
	mov	x8, #4607182418800017408
	str	x8, [x3]
	cmp	w0, #1
	b.lt	LBB0_4
; %bb.1:
	fmul	d1, d0, d1
	fmov	d0, #1.00000000
LBB0_2:                                 ; =>This Inner Loop Header: Depth=1
	fmul	d0, d1, d0
	subs	w0, w0, #1
	b.ne	LBB0_2
; %bb.3:
	str	d0, [x3]
LBB0_4:
	str	wzr, [x2]
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
