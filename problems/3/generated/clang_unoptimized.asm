	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_helperFunction                 ; -- Begin function helperFunction
	.p2align	2
_helperFunction:                        ; @helperFunction
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	w0, [sp, #12]
	ldr	w8, [sp, #12]
	mov	w9, #0
	mul	w0, w8, w9
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #80
	.cfi_def_cfa_offset 80
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	w0, [x29, #-4]
	stur	w1, [x29, #-8]
	stur	d0, [x29, #-16]
	stur	d1, [x29, #-24]
	str	x2, [sp, #32]
	str	x3, [sp, #24]
	str	x4, [sp, #16]
	str	x5, [sp, #8]
	str	x6, [sp]
	ldur	w0, [x29, #-4]
	bl	_helperFunction
	add	w8, w0, #5
	ldr	x9, [sp, #16]
	str	w8, [x9]
	ldur	d0, [x29, #-16]
	ldur	d2, [x29, #-24]
	fmov	d1, #1.00000000
	fmul	d2, d2, d1
	fmadd	d0, d0, d1, d2
	movi	d1, #0000000000000000
	fadd	d0, d0, d1
	ldr	x8, [sp, #8]
	str	d0, [x8]
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
