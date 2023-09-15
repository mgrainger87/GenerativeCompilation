	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:
	subs	w8, w0, #1
	b.lt	LBB0_2
; %bb.1:
	sub	w9, w0, #2
	umull	x8, w8, w9
	lsr	x8, x8, #1
	add	w8, w8, w0, lsl #1
	sub	w8, w8, #1
	b	LBB0_3
LBB0_2:
	mov	w8, #0
LBB0_3:
	str	w8, [x2]
	str	xzr, [x3]
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
