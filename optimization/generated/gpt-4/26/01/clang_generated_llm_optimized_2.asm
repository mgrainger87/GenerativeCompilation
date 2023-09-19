//solution_number=2,compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section	__TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0	sdk_version 13, 3
.globl	_customFunction                 ; -- Begin function customFunction
.p2align	2
_customFunction:                        ; @customFunction
.cfi_startproc
; Compute (int1 * 6) and store the result at outInt
lsl     w8, w0, #2                  ; w8 = int1 * 4
add     w8, w8, w0, lsl #1          ; w8 = w8 + int1 * 2 = int1 * 6
str     w8, [x2]                    ; *outInt = w8

; Compute (double1 * 8) using fmadd and store the result at outDouble
fmov    d1, #7.00000000             ; Load immediate 7 into d1
fmadd   d0, d0, d1, d0              ; d0 = double1 * 7 + double1 = double1 * 8
str     d0, [x3]                    ; *outDouble = d0

ret
.cfi_endproc
; -- End function
.subsections_via_symbols
