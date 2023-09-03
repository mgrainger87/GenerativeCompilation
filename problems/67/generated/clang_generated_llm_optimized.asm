	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction
	.p2align	2
_customFunction:
	.cfi_startproc
	; Multiply int2 by (int1 & 3)
	and	w8, w0, #0x3
	mul	w8, w8, w1
	
	; Store result in the location pointed by outInt
	str	w8, [x2]
	
	; Add double1 and double2 and store result in the location pointed by outDouble
	fadd	d0, d0, d1
	str	d0, [x3]
	
	ret
	.cfi_endproc
.subsections_via_symbols
