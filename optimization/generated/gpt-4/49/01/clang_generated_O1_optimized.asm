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
	mov	x8, #4632233691727265792
	fmov	d2, x8
	fcmp	d1, d2
	b.le	LBB0_2
; %bb.1:
	str	d0, [x3]
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	ret
LBB0_2:
	fmov	d2, #10.00000000
	fcmp	d1, d2
	b.pl	LBB0_4
; %bb.3:
	add	w1, w1, #1
	fmov	d2, #2.00000000
	fadd	d0, d0, d2
	fmov	d2, #5.00000000
	b	LBB0_5
LBB0_4:
	add	w1, w1, #2
	fmov	d3, #-2.00000000
	fadd	d0, d0, d3
LBB0_5:
	fadd	d1, d1, d2
	bl	_customFunction
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
