	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction
	.p2align	2
_customFunction:
	.cfi_startproc
    ; No need to adjust sp because we're not using local variables or pushing registers

    ; Store int2 in the memory location pointed by outInt
	str	w1, [x2]
    
    ; Add double1 and double2 and store the result in the memory location pointed by outDouble
	fadd	d0, d0, d1
	str	d0, [x3]

	ret
	.cfi_endproc
