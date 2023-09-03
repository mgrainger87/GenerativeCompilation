	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction
	.p2align	2
_customFunction:
	.cfi_startproc

; Perform the integer arithmetic
	subs	x0, x0, #6
	add	x0, x0, x1

; Store the result to memory pointed to by outInt
	str	w0, [x2]

; Return
	ret
	.cfi_endproc
