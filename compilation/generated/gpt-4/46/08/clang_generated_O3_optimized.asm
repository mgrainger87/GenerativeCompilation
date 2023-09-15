	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:
	mul	w8, w1, w0
	str	w8, [x2]
	str	d1, [x3]
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
