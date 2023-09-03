.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction
.p2align	2
_customFunction:
	.cfi_startproc

	; sum up int1 and int2
	add	w8, w0, w1

	; store the result to the location pointed by outInt
	str	w8, [x2]

	; return
	ret
	.cfi_endproc
