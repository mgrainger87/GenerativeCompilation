	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:
	cmp	w0, #0
	csel	w8, w0, wzr, gt
	add	w8, w8, w1
	str	w8, [x2]
	str	d1, [x3]
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
