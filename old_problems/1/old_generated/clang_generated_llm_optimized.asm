.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction                 
.p2align	2
_customFunction:                        
	.cfi_startproc

; Integer Operations
	mov	w10, #3
	mul	w1, w1, w10
	add	w1, w1, w0, lsl #1
	add	w1, w1, #10
	str	w1, [x4]

; Floating Point Operations
	fadd	d0, d0, d1
	fmov	d1, #5.50000000
	fadd	d0, d0, d1
	str	d0, [x5]

	ret
	.cfi_endproc
.subsections_via_symbols
