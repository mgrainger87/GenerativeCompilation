	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:
	subs	w8, w1, w0
	b.ge	LBB0_2
; %bb.1:
	mov	w8, #0
	str	w8, [x2]
	str	xzr, [x3]
	ret
LBB0_2:
	madd	w9, w8, w0, w8
	mvn	w10, w0
	add	w10, w10, w1
	umull	x8, w10, w8
	lsr	x8, x8, #1
	add	w9, w9, w0
	add	w8, w9, w8
	str	w8, [x2]
	str	xzr, [x3]
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
