.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction
.p2align	2
_customFunction:
.cfi_startproc

; Compute w0 * w1
mul	w8, w0, w1

; Compute 3w0 and add to result
lsl	w9, w0, #1    ; w9 = 2 * w0
add	w8, w8, w9    ; w8 = w8 + 2 * w0
add	w8, w8, w0    ; w8 = w8 + w0 (Now w8 has w0 * w1 + 3w0)

; Compute 5w1 and add to result
lsl	w9, w1, #2    ; w9 = 4 * w1
add	w8, w8, w9    ; w8 = w8 + 4 * w1
add	w8, w8, w1    ; w8 = w8 + w1 (Now w8 has w0 * w1 + 3w0 + 5w1)

; Add constant 15 to result
add	w8, w8, #15

; Store result
str	w8, [x2]

ret
.cfi_endproc
