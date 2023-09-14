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
	fcmp	d1, #0.0
	b.ls	LBB0_2
; %bb.1:
	add	w0, w0, #1
	sub	w1, w1, #1
	fmov	d2, #0.50000000
	fadd	d0, d0, d2
	fmov	d2, #-0.50000000
	fadd	d1, d1, d2
	bl	_customFunction
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	ret
LBB0_2:
	str	w0, [x2]
	fadd	d0, d0, d1
	str	d0, [x3]
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
