	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:
	; Add 7 to int1 and store the result in x8
	add	x8, x0, #7

	; Subtract 0.5 from double2 and store the result in d2
	fmov	d2, #0.50000000
	fsub	d2, d1, d2

	; Convert the 32-bit integer result (in w8) to float and store in d3
	scvtf	d3, w8

	; Add the two floating point numbers
	fadd	d3, d3, d2

	; Store the result in memory pointed by outDouble
	str	d3, [x3]

	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
