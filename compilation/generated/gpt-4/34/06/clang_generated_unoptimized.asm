	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64
	.cfi_def_cfa_offset 64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	w0, [x29, #-4]
	stur	w1, [x29, #-8]
	stur	d0, [x29, #-16]
	str	d1, [sp, #24]
	str	x2, [sp, #16]
	str	x3, [sp, #8]
	ldr	d0, [sp, #24]
	fcmp	d0, #0.0
	cset	w8, hi
	tbnz	w8, #0, LBB0_2
	b	LBB0_1
LBB0_1:
	ldur	w8, [x29, #-4]
	ldr	x9, [sp, #16]
	str	w8, [x9]
	ldur	d0, [x29, #-16]
	ldr	d1, [sp, #24]
	fadd	d0, d0, d1
	ldr	x8, [sp, #8]
	str	d0, [x8]
	b	LBB0_3
LBB0_2:
	ldur	w8, [x29, #-4]
	add	w0, w8, #1
	ldur	w8, [x29, #-8]
	subs	w1, w8, #1
	ldur	d0, [x29, #-16]
	fmov	d2, #0.50000000
	fadd	d0, d0, d2
	ldr	d1, [sp, #24]
	fsub	d1, d1, d2
	ldr	x2, [sp, #16]
	ldr	x3, [sp, #8]
	bl	_customFunction
	b	LBB0_3
LBB0_3:
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols