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
	cmp	w0, w1
	b.ne	LBB0_2
; %bb.1:
	str	w0, [x2]
	str	d0, [x3]
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	ret
LBB0_2:
	add	w0, w0, #1
	sub	w1, w1, #1
	bl	_customFunction
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
