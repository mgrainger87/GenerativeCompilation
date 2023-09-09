.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction
.p2align	2
_customFunction:
.cfi_startproc

; Compute w0 * w1
mul	w8, w0, w1

; Compute 3w0 using (w0 << 1) + w0
lsl	w9, w0, #1
add	w9, w9, w0

; Add 3w0 to result
add	w8, w8, w9

; Compute 5w1 using (w1 << 2) + w1
lsl	w9, w1, #2
add	w9, w9, w1

; Add 5w1 and constant 15 to result
add	w8, w8, w9
add	w8, w8, #15

; Store result
str	w8, [x2]

ret
.cfi_endproc
