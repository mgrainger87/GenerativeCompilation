//solution_number=1,compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section    __TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0    sdk_version 13, 3
.globl    _customFunction                 ; -- Begin function customFunction
.p2align    2
_customFunction:                        ; @customFunction
.cfi_startproc
; %bb.0:
; Compute \( \text{int} \, a = \text{int1} \times 6 \)
mov    w8, #6
mul    w8, w0, w8

; Store the result to *outInt
str    w8, [x2]

; Compute \( \text{double} \, x = \text{double1} \times 1.5 \)
fmov    d8, #1.5
fmul    d8, d0, d8

; Store the result to *outDouble
str    d8, [x3]

ret
.cfi_endproc
; -- End function
.subsections_via_symbols
