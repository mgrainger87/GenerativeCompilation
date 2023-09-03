	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64
	.cfi_def_cfa_offset 64
	str	w0, [sp, #60]
	str	w1, [sp, #56]
	str	d0, [sp, #48]
	str	d1, [sp, #40]
	str	x2, [sp, #32]
	str	x3, [sp, #24]
	ldr	w8, [sp, #56]
	mov	w9, #10
	mul	w8, w8, w9
	str	w8, [sp, #20]
	ldr	w8, [sp, #20]
	str	w8, [sp, #16]
	ldr	w8, [sp, #16]
	ldr	x9, [sp, #32]
	str	w8, [x9]
	ldr	d0, [sp, #40]
	fmov	d1, #2.00000000
	fmul	d0, d0, d1
	str	d0, [sp, #8]
	ldr	d0, [sp, #8]
	str	d0, [sp]
	ldr	d0, [sp]
	ldr	x8, [sp, #24]
	str	d0, [x8]
	add	sp, sp, #64
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
