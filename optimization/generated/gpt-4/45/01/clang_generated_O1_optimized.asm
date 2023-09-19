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
	fmov	d2, d0
	mov	x9, #4632233691727265792
	fmov	d0, x9
	fcmp	d2, d0
	b.le	LBB0_2
; %bb.1:
	fmov	d0, #5.00000000
	fadd	d0, d1, d0
	str	d0, [x3]
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	ret
LBB0_2:
	mov	x8, x0
	fadd	d0, d2, d1
	mov	x0, x1
	mov	x1, x8
	fmov	d1, d2
	bl	_customFunction
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
