	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction
	.p2align	2
_customFunction:                        
	.cfi_startproc

	// Optimize integer operation
	mov	w9, #4
	mul	w8, w0, w9      // Multiply int1 by 4
	str	w8, [x2]       // Store result to *outInt

	// Optimize floating point operation
	fmov	d1, #4.00000000
	fmul	d0, d0, d1      // Multiply double1 by 4
	str	d0, [x3]        // Store result to *outDouble

	ret
	.cfi_endproc
