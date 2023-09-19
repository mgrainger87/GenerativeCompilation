	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 ; -- Begin function customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc
; %bb.0:
	tbnz	w1, #31, LBB0_3
; %bb.1:
	mov	w8, #3
LBB0_2:                                 ; =>This Inner Loop Header: Depth=1
	tst	w1, #0x1
	cinc	w9, w8, ne
	add	w0, w0, w9
	orr	w9, w1, #0xfffffffe
	adds	w1, w1, w9
	b.pl	LBB0_2
LBB0_3:
	str	w0, [x2]
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
