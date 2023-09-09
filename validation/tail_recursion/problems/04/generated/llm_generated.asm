.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction
.p2align	2
_customFunction:
.cfi_startproc
; Store int1 directly to the location pointed by outInt
str	w0, [x2]

; Store double1 directly to the location pointed by outDouble
str	d0, [x3]

ret
.cfi_endproc
