	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:
	mov	w8, #1
	str	w8, [x2]
	cmp	w0, #1
	b.lt	LBB0_4
; %bb.1:
	mov	w9, #0
	mov	w8, #1
LBB0_2:                                 ; =>This Inner Loop Header: Depth=1
	add	w9, w9, #1
	mul	w8, w8, w9
	cmp	w0, w9
	b.ne	LBB0_2
; %bb.3:
	str	w8, [x2]
LBB0_4:
	str	xzr, [x3]
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
