	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction
	.p2align	2
_customFunction:                        
	.cfi_startproc
	; Reserve stack space
	sub	sp, sp, #32
	
	; int tmp1 = int1 * 2;
	lsl	w8, w0, #1

	; int tmp2 = int2 - 5;
	subs	w9, w1, #5
	
	; int tmp3 = int1 + int2;
	add	w10, w0, w1
	
	; *outInt = tmp3;
	str	w10, [x2]

	; double tmpDouble1 = double1 / 2;
	fmov	d2, #2.00000000
	fdiv	d2, d0, d2

	; double tmpDouble2 = double2 * 3;
	fmov	d3, #3.00000000
	fmul	d3, d1, d3

	; *outDouble = double1 + double2;
	fadd	d0, d0, d1
	str	d0, [x3]

	; Restore stack pointer and return
	add	sp, sp, #32
	ret
	
	.cfi_endproc
