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
	sub	w8, w0, w1
	fadd	d0, d0, d1
	fmov	d2, #0.50000000
	fmul	d2, d0, d2
	cmp	w8, #11
	b.lt	LBB0_2
; %bb.1:
	str	d2, [x3]
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	ret
LBB0_2:
	mov	x0, x1
	mov	x1, x8
	fmov	d0, d1
	fmov	d1, d2
	bl	_customFunction
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
