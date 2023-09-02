	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction
	.p2align	2
_customFunction:
	.cfi_startproc

    // *outInt = int2
	str	w1, [x2]

    // *outDouble = (double1 + double2) * (double1 - double2)
	fadd	d4, d0, d1
	fsub	d5, d0, d1
	fmul	d4, d4, d5
	str	d4, [x3]

	ret
	.cfi_endproc
.subsections_via_symbols
