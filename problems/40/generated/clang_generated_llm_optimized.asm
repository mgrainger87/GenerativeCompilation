	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:
	; Add the integer values and store the result
	add	w8, w0, w1
	str	w8, [x2]

	; Add the double values and store the result
	fadd	d2, d0, d1
	str	d2, [x3]

	ret
	.cfi_endproc
