	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:

	; We can skip the impossible condition related to int1 && !int1

	; Compute the double addition
	fadd	d0, d0, d1

	; Store the result to outDouble
	str	d0, [x3]
	
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
