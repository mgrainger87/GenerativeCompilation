.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction
.p2align	2
_customFunction:
.cfi_startproc

; Compute w0 * w1
mul	w8, w0, w1

; Compute w0 * 3 and add to w8
mov	w10, #3
madd	w8, w0, w10, w8

; Compute 5 * w1 and add to w8
mov	w10, #5
madd	w8, w10, w1, w8

; Add 15 to w8
add	w8, w8, #15

; Store result
str	w8, [x2]

ret
.cfi_endproc
