.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction
.p2align	2
_customFunction:
.cfi_startproc

; Compute (w1 + 3)
add	w9, w1, #3

; Compute 5 * (w1 + 3)
mov	w10, #5
mul	w10, w10, w9

; Compute w0 * (w1 + 3) + 5 * (w1 + 3)
madd	w8, w0, w9, w10

; Store result
str	w8, [x2]

ret
.cfi_endproc
