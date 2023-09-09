.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction
.p2align	2
_customFunction:
.cfi_startproc

; Simplified arithmetic operations
add	w8, w0, #5    ; int1 + 5
add	w9, w1, #3    ; int2 + 3
mul	w8, w8, w9

; Store result
str	w8, [x2]

ret
.cfi_endproc
