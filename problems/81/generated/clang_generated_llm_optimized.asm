	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_customFunction
	.p2align	2
_customFunction: 
	.cfi_startproc
; Store int1 (w0) directly to the address pointed by outInt (x2)
	str	w0, [x2]

; Store double1 (d0) directly to the address pointed by outDouble (x3)
	str	d0, [x3]

	ret
	.cfi_endproc
