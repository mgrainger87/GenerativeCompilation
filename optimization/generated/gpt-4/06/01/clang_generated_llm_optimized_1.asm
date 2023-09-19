//solution_number=1,compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction
.p2align	2
_customFunction:
.cfi_startproc
; %bb.0:
; int1 + 10 - 5 => int1 + 5
add	w8, w0, #5

; int2 + 5 - 2 => int2 + 3
add	w9, w1, #3

; Multiplication
mul	w8, w8, w9

; Store the result
str	w8, [x2]

ret
.cfi_endproc
