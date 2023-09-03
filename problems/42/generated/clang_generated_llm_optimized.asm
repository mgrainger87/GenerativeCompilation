	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:
	mov	w8, #4
	sdiv	w9, w1, w8                     ; Divide int2 by 4
	str	w9, [x2]                       ; Store result to *outInt

	fmov	d1, #2.00000000
	fdiv	d0, d0, d1                    ; Divide double1 by 2.0
	str	d0, [x3]                       ; Store result to *outDouble

	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
