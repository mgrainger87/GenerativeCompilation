	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:
	mov	x8, #-7378697629483820647
	movk	x8, #39322
	movk	x8, #16369, lsl #48
	fmov	d2, x8
	fadd	d0, d0, d2
	fadd	d0, d0, d1
	mov	x8, #-7378697629483820647
	movk	x8, #39322
	movk	x8, #49081, lsl #48
	fmov	d1, x8
	fadd	d0, d0, d1
	str	d0, [x3]
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
