	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:
	tbnz	w0, #0, LBB0_2
; %bb.1:
	cmp	w0, #0
	cinc	w8, w0, lt
	asr	w8, w8, #1
	str	w8, [x2]
	fadd	d0, d0, d0
	str	d0, [x3]
	ret
LBB0_2:
	str	w0, [x2]
	str	d0, [x3]
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
