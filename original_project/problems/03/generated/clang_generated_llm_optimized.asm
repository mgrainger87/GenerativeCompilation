	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:
	mov	w8, #0                        ; Move integer 0 to w8
	str	w8, [x2]                      ; Store w8 to outInt location

	movi	d8, #0000000000000000         ; Move double 0.0 to d8
	str	d8, [x3]                      ; Store d8 to outDouble location

	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
