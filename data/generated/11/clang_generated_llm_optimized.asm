.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction
.p2align	2
_customFunction:
.cfi_startproc
; Parameters:
; int1: w0
; int2: w1
; outInt: x2

; int1 + 10 - 5
add	w8, w0, #5

; int2 + 5 - 2
add	w9, w1, #3

; Multiply and store the result
mul	w8, w8, w9
str	w8, [x2]

ret
.cfi_endproc
.subsections_via_symbols
