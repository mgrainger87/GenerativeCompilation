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
	str	wzr, [sp, #20]
	b	LBB0_1
LBB0_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #20]
	ldr	w9, [sp, #60]
	subs	w8, w8, w9
	cset	w8, ge
	tbnz	w8, #0, LBB0_4
	b	LBB0_2
LBB0_2:                                 ;   in Loop: Header=BB0_1 Depth=1
	ldr	w8, [sp, #60]
	ldr	w9, [sp, #56]
	mul	w8, w8, w9
	ldr	x9, [sp, #32]
	str	w8, [x9]
	b	LBB0_3
LBB0_3:                                 ;   in Loop: Header=BB0_1 Depth=1
	ldr	w8, [sp, #20]
	add	w8, w8, #1
	str	w8, [sp, #20]
	b	LBB0_1
LBB0_4:
	ldr	w8, [sp, #60]
	ldr	w9, [sp, #56]
	add	w8, w8, w9
	ldr	x9, [sp, #32]
	str	w8, [x9]
	str	wzr, [sp, #16]
	b	LBB0_5
LBB0_5:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #16]
	ldr	w9, [sp, #56]
	subs	w8, w8, w9
	cset	w8, ge
	tbnz	w8, #0, LBB0_8
	b	LBB0_6
LBB0_6:                                 ;   in Loop: Header=BB0_5 Depth=1
	ldr	d0, [sp, #48]
	fmov	d1, #2.00000000
	fmul	d0, d0, d1
	str	d0, [sp, #8]
	b	LBB0_7
LBB0_7:                                 ;   in Loop: Header=BB0_5 Depth=1
	ldr	w8, [sp, #16]
	add	w8, w8, #1
	str	w8, [sp, #16]
	b	LBB0_5
LBB0_8:
	ldr	d0, [sp, #48]
	ldr	d1, [sp, #40]
	fadd	d0, d0, d1
	ldr	x8, [sp, #24]
	str	d0, [x8]
	add	sp, sp, #64
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
