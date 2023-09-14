	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64
	.cfi_def_cfa_offset 64
	str	w0, [sp, #60]
	str	w1, [sp, #56]
	str	d0, [sp, #48]
	str	d1, [sp, #40]
	str	x2, [sp, #32]
	str	x3, [sp, #24]
	ldr	w8, [sp, #60]
	subs	w8, w8, #10
	cset	w8, le
	tbnz	w8, #0, LBB0_2
	b	LBB0_1
LBB0_1:
	ldr	w8, [sp, #60]
	ldr	w9, [sp, #56]
	mul	w8, w8, w9
	str	w8, [sp, #20]                   ; 4-byte Folded Spill
	b	LBB0_3
LBB0_2:
	ldr	w8, [sp, #60]
	ldr	w9, [sp, #56]
	add	w8, w8, w9
	str	w8, [sp, #20]                   ; 4-byte Folded Spill
	b	LBB0_3
LBB0_3:
	ldr	w8, [sp, #20]                   ; 4-byte Folded Reload
	ldr	x9, [sp, #32]
	str	w8, [x9]
	ldr	d0, [sp, #40]
	fmov	d1, #5.00000000
	fcmp	d0, d1
	cset	w8, pl
	tbnz	w8, #0, LBB0_5
	b	LBB0_4
LBB0_4:
	ldr	d0, [sp, #48]
	str	d0, [sp, #8]                    ; 8-byte Folded Spill
	b	LBB0_6
LBB0_5:
	ldr	d0, [sp, #40]
	str	d0, [sp, #8]                    ; 8-byte Folded Spill
	b	LBB0_6
LBB0_6:
	ldr	d0, [sp, #8]                    ; 8-byte Folded Reload
	ldr	x8, [sp, #24]
	str	d0, [x8]
	add	sp, sp, #64
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
