	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:
	cmp	w0, #0
	cneg	w8, w0, mi
	str	w8, [x2]
	fneg	d0, d1
	fcmp	d1, #0.0
	fcsel	d0, d0, d1, mi
	str	d0, [x3]
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
