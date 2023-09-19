	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:
	cmp	w1, #0
	cinc	w8, w1, lt
	asr	w8, w8, #1
	add	w8, w8, w0, lsl #1
	sub	w9, w1, w0
	sub	w10, w0, w1
	cmp	w8, #10
	csel	w9, w10, w9, gt
	add	w8, w9, w8
	str	w8, [x2]
	fadd	d0, d0, d1
	str	d0, [x3]
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
