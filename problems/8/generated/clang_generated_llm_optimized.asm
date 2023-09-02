	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
	; *outInt = int1;
	str	w0, [x2]                         ; store int1 to *outInt without multiplication and division

	; *outDouble = double1 * double2;
	fmul	d0, d0, d1                      ; multiply double1 with double2
	str	d0, [x3]                         ; store result to *outDouble

	ret                                 ; return
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
