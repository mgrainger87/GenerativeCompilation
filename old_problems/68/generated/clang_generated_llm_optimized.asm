	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc

	; Loop 4 times to store the square of int1 at the address pointed by outInt
	mov 	w8, #4                      ; Load loop count into w8

1:                                      ; Begin loop
	mul	w9, w0, w0                  ; Multiply int1 with itself
	str	w9, [x2]                   ; Store the result at address pointed by outInt
	subs	w8, w8, #1                 ; Decrement loop counter
	b.ne	1b                         ; Loop back if w8 is not zero

	ret                              ; Return from function

	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
