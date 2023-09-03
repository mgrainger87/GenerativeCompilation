.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction                 ; -- Begin function customFunction
.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc

; int arithmetic
	subs	w8, w0, w1              ; subtract int1 from int2
	str	w8, [x2]                ; store result to *outInt

; double arithmetic
	fadd	d0, d0, d1              ; add double1 and double2
	str	d0, [x3]                ; store result to *outDouble

	ret
	.cfi_endproc
.subsections_via_symbols
