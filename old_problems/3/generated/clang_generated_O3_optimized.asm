	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_helperFunction                 ; -- Begin function helperFunction
	.p2align	2
_helperFunction:                        ; @helperFunction
	.cfi_startproc
; %bb.0:
	mov	w0, #0
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:
	mov	w8, #5
	str	w8, [x4]
	fadd	d0, d0, d1
	movi	d1, #0000000000000000
	fadd	d0, d0, d1
	str	d0, [x5]
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
