//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=2
.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction
.p2align	2
_customFunction:
.cfi_startproc

; Compute int1 * int2
mul	w8, w0, w1

; Compute 5 * int2
mov 	w9, #5
madd 	w8, w1, w9, w8

; Compute 3 * int1
mov 	w10, #3
madd 	w8, w0, w10, w8

; Add 15
add 	w0, w8, #15

; Storing the result in the location pointed by outInt
str	w0, [x2]

ret
.cfi_endproc
.subsections_via_symbols
