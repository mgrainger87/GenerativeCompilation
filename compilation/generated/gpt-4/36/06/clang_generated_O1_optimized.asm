	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	.cfi_def_cfa_offset 16
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	fcmp	d0, d1
	b.ne	LBB0_2
; %bb.1:
	str	w1, [x2]
	str	d1, [x3]
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	ret
LBB0_2:
	add	w1, w1, #1
	mov	x8, #-7378697629483820647
	movk	x8, #39322
	movk	x8, #49081, lsl #48
	fmov	d2, x8
	fadd	d0, d0, d2
	mov	x8, #-7378697629483820647
	movk	x8, #39322
	movk	x8, #16313, lsl #48
	fmov	d2, x8
	fadd	d1, d1, d2
	bl	_customFunction
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
