	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:
	fmov	d2, #2.50000000                 ; Load 2.5 into d2
	fmadd	d0, d0, d2, d1                 ; Compute d0 * d2 + d1
	str	d0, [x3]                       ; Store result to outDouble
	ret
	.cfi_endproc
.subsections_via_symbols
