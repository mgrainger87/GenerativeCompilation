	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc

; Subtract the two integer arguments and store the result in the outInt pointer
	subs	w8, w0, w1
	str	w8, [x2]

; Add the two double arguments and store the result in the outDouble pointer
	fadd	d2, d0, d1
	str	d2, [x3]

	ret
	.cfi_endproc
