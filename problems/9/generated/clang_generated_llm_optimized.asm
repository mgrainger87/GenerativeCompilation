	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction
	.p2align	2
_customFunction:                        ; @customFunction
	.cfi_startproc

	; int1 and int2 are already in x0 and x1 respectively. 
    ; However, since sum1 - sum2 is always 0, we directly store 0 into *outInt without any computation
	mov	w8, #0
	str	w8, [x2]
	
	; Multiplying double1 and double2
	fmul	d0, d0, d1
	str	d0, [x3]
	
	ret
	.cfi_endproc
.subsections_via_symbols
