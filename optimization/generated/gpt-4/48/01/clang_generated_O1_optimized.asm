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
	tbnz	w1, #31, LBB0_3
; %bb.1:
	tbnz	w1, #0, LBB0_4
; %bb.2:
	add	w0, w0, #3
	sub	w1, w1, #2
	b	LBB0_5
LBB0_3:
	str	w0, [x2]
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	ret
LBB0_4:
	add	w0, w0, #4
	sub	w1, w1, #1
LBB0_5:
	bl	_customFunction
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
