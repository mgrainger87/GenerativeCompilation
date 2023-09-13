	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:
	str	w0, [x2]
	cmp	w0, #1
	b.lt	LBB0_5
; %bb.1:
	mov	w8, #0
	add	w9, w1, w0
	b	LBB0_3
LBB0_2:                                 ;   in Loop: Header=BB0_3 Depth=1
	add	w8, w8, #1
	cmp	w0, w8
	b.eq	LBB0_5
LBB0_3:                                 ; =>This Inner Loop Header: Depth=1
	tbnz	w8, #0, LBB0_2
; %bb.4:                                ;   in Loop: Header=BB0_3 Depth=1
	str	w9, [x2]
	b	LBB0_2
LBB0_5:
	sub	w8, w0, w1
	str	w8, [x2]
	fadd	d0, d0, d1
	str	d0, [x3]
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
