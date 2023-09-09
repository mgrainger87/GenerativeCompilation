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
	mov	w9, #1
	sdiv	w8, w8, w9
	ldr	x9, [sp, #16]
	str	w8, [x9]
	ldr	d0, [sp, #32]
	fmov	d1, #1.00000000
	fdiv	d0, d0, d1
	ldr	x8, [sp, #8]
	str	d0, [x8]
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
