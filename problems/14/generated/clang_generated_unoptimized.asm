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
	add	w8, w8, #7
	str	w8, [sp, #20]
	ldr	d0, [sp, #40]
	fmov	d1, #0.50000000
	fsub	d0, d0, d1
	str	d0, [sp, #8]
	ldr	s1, [sp, #20]
                                        ; implicit-def: $d0
	fmov	s0, s1
	sshll.2d	v0, v0, #0
                                        ; kill: def $d0 killed $d0 killed $q0
	scvtf	d0, d0
	ldr	d1, [sp, #8]
	fadd	d0, d0, d1
	ldr	x8, [sp, #24]
	str	d0, [x8]
	add	sp, sp, #64
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
