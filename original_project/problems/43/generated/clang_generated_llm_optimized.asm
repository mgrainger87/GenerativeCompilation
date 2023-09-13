	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:

    ; Tripling the integer int1
	add	w8, w0, w0
	add	w8, w8, w0

    ; Storing the result to *outInt
	str	w8, [x2]

    ; Quadrupling the double double1
	fadd	d8, d0, d0
	fadd	d8, d8, d0
	fadd	d8, d8, d0

    ; Storing the result to *outDouble
	str	d8, [x3]

	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
