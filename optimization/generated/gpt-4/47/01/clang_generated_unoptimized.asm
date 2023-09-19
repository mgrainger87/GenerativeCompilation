	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
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
	ldur	w8, [x29, #-4]
	ldur	w9, [x29, #-8]
	subs	w8, w8, w9
	str	w8, [sp, #20]
	ldur	d0, [x29, #-16]
	ldur	d1, [x29, #-24]
	fadd	d0, d0, d1
	fmov	d1, #2.00000000
	fdiv	d0, d0, d1
	str	d0, [sp, #8]
	ldr	w8, [sp, #20]
	subs	w8, w8, #10
	cset	w8, le
	tbnz	w8, #0, LBB0_2
	b	LBB0_1
LBB0_1:
	ldr	d0, [sp, #8]
	ldr	x8, [sp, #24]
	str	d0, [x8]
	b	LBB0_3
LBB0_2:
	ldur	w0, [x29, #-8]
	ldr	w1, [sp, #20]
	ldur	d0, [x29, #-24]
	ldr	d1, [sp, #8]
	ldr	x2, [sp, #32]
	ldr	x3, [sp, #24]
	bl	_customFunction
	b	LBB0_3
LBB0_3:
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
