	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #80
	.cfi_def_cfa_offset 80
	str	w0, [sp, #76]
	str	w1, [sp, #72]
	str	d0, [sp, #64]
	str	d1, [sp, #56]
	str	x2, [sp, #48]
	str	x3, [sp, #40]
	ldr	w8, [sp, #76]
	lsl	w8, w8, #1
	str	w8, [sp, #36]
	ldr	w8, [sp, #72]
	subs	w8, w8, #5
	str	w8, [sp, #32]
	ldr	w8, [sp, #76]
	ldr	w9, [sp, #72]
	add	w8, w8, w9
	str	w8, [sp, #28]
	ldr	w8, [sp, #28]
	ldr	x9, [sp, #48]
	str	w8, [x9]
	ldr	d0, [sp, #64]
	fmov	d1, #2.00000000
	fdiv	d0, d0, d1
	str	d0, [sp, #16]
	ldr	d0, [sp, #56]
	fmov	d1, #3.00000000
	fmul	d0, d0, d1
	str	d0, [sp, #8]
	ldr	d0, [sp, #64]
	ldr	d1, [sp, #56]
	fadd	d0, d0, d1
	ldr	x8, [sp, #40]
	str	d0, [x8]
	add	sp, sp, #80
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
