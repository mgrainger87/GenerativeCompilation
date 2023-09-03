	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
	; Calculate int1 * 4 and store it to the location pointed by outInt
	lsl	w8, w0, #2                  ; w8 = int1 * 4
	str	w8, [x2]                    ; Store the result to outInt

	; Add double1 and double2 and store it to the location pointed by outDouble
	fadd	d0, d0, d1                 ; d0 = double1 + double2
	str	d0, [x3]                    ; Store the result to outDouble

	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
