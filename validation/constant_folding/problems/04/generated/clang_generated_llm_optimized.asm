.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction                 ; -- Begin function customFunction
.p2align	2
_customFunction:                        ; @customFunction
.cfi_startproc
    sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	str	w0, [sp, #44]
	str	w1, [sp, #40]
	str	d0, [sp, #32]
	str	d1, [sp, #24]
    mov w8, w0
    lsl w8, w8, #1
	str	w8, [x2]
	fmov	d0, d2
    fmov	d1, #2.00000000
	fmsub	d0, d0, d1, d2
	str	d0, [x3]
	add	sp, sp, #48
    ret
.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
