	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:
	fadd	d0, d1, d1
	movi	d1, #0000000000000000
	fadd	d1, d0, d1
	fadd	d1, d0, d1
	fadd	d0, d0, d1
	str	w0, [x2]
	str	d0, [x3]
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
