	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:
	mov	w8, #6
	cmp	w0, #6
	csel	w8, w0, w8, lt
	sub	w8, w0, w8
	add	w8, w8, #1
	and	w8, w8, #0xfffffffe
	sub	w8, w0, w8
	sub	w8, w8, #2
	cmp	w0, #5
	csel	w8, w0, w8, lt
	add	w8, w8, w1
	str	w8, [x2]
	str	d1, [x3]
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
