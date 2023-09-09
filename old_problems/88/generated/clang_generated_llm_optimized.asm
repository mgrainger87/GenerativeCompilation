	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction
	.p2align	2
_customFunction:                        
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16                       ; Adjust stack for 2 local storage spaces (8 bytes each)
	.cfi_def_cfa_offset 16

	add	w4, w0, w1                        ; Sum the two integers
	str	w4, [x2]                         ; Store the result at the location pointed to by outInt

	fsub	d2, d0, d1                       ; Subtract double2 from double1
	str	d2, [x3]                         ; Store the result at the location pointed to by outDouble

	add	sp, sp, #16                       ; Reset the stack pointer
	ret

	.cfi_endproc
.subsections_via_symbols
