	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction                 
	.p2align	2
_customFunction:                        
	.cfi_startproc

	; Calculate average value once
	add	w8, w0, w1              ; w8 = int1 + int2
	scvtf	d2, w8                ; Convert sum to double
	fadd	d2, d2, d0            ; Add double1
	fadd	d2, d2, d1            ; Add double2
	fmov	d3, #4.00000000       ; Load 4.0 into d3
	fdiv	d2, d2, d3            ; Divide by 4.0

	; Store the value once
	str	d2, [x3]              ; Store to outDouble

	ret
	.cfi_endproc
