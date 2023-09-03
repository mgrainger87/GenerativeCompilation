	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:

	; Calculate (double1 + 1.0)
	fmov	d2, #1.00000000
	fadd	d0, d0, d2

	; Calculate (double2 + 0.5)
	fmov	d2, #0.50000000
	fadd	d1, d1, d2

	; Divide the results
	fdiv	d0, d0, d1

	; Store the result in *outDouble
	str	d0, [x3]

	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
