	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:
	cmp	w0, #100
	b.eq	LBB0_3
; %bb.1:
	mov	w8, #5
	mov	w9, #-5
LBB0_2:                                 ; =>This Inner Loop Header: Depth=1
	cmp	w0, w1
	cneg	w10, w8, ge
	add	w0, w0, w10
	cneg	w10, w9, ge
	add	w1, w1, w10
	cmp	w0, #100
	b.ne	LBB0_2
LBB0_3:
	str	w1, [x2]
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
