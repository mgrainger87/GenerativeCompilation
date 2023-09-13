	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3                               ; -- Begin function customFunction
lCPI0_0:
	.quad	0x3fb999999999999a              ; double 0.10000000000000001
lCPI0_1:
	.quad	0x3ff199999999999a              ; double 1.1000000000000001
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	str	w0, [sp, #44]
	str	w1, [sp, #40]
	str	d0, [sp, #32]
	str	d1, [sp, #24]
	str	x2, [sp, #16]
	str	x3, [sp, #8]
	ldr	d0, [sp, #32]
	adrp	x8, lCPI0_1@PAGE
	ldr	d1, [x8, lCPI0_1@PAGEOFF]
	fadd	d0, d0, d1
	str	d0, [sp]
	ldr	d0, [sp]
	ldr	d1, [sp, #24]
	fadd	d0, d0, d1
	adrp	x8, lCPI0_0@PAGE
	ldr	d1, [x8, lCPI0_0@PAGEOFF]
	fsub	d0, d0, d1
	ldr	x8, [sp, #8]
	str	d0, [x8]
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
