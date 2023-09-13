	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	str	w0, [sp, #44]
	str	w1, [sp, #40]
	str	d0, [sp, #32]
	str	d1, [sp, #24]
	str	x2, [sp, #16]
	str	x3, [sp, #8]
	ldr	w8, [sp, #44]
	ldr	w9, [sp, #40]
	mov	w10, #0
	mul	w9, w9, w10
	add	w8, w8, w9
	lsl	w8, w8, #1
	ldr	x9, [sp, #16]
	str	w8, [x9]
	ldr	d2, [sp, #32]
	ldr	d0, [sp, #24]
	movi	d1, #0000000000000000
	fmsub	d0, d0, d1, d2
	fmov	d1, #2.00000000
	fmul	d0, d0, d1
	ldr	x8, [sp, #8]
	str	d0, [x8]
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
