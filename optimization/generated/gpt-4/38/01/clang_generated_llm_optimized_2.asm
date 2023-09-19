//solution_number=2,compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=2
.section    __TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0    sdk_version 13, 3
.globl    _customFunction                 ; -- Begin function customFunction
.p2align    2
_customFunction:                        ; @customFunction
.cfi_startproc
; %bb.0:
; Compute int a = int1 * 6 using optimized method: a = (int1 << 2) + int1 + int1
mov    w9, w0
lsl    w0, w0, #2
add    w0, w0, w9
add    w0, w0, w9

; Store the result to *outInt
str    w0, [x2]

; Compute double x = double1 * 1.5 directly into d0
fmov    d8, #1.5
fmul    d0, d0, d8

; Store the result to *outDouble
str    d0, [x3]

ret
.cfi_endproc
; -- End function
.subsections_via_symbols
