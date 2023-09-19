//solution_number=1,compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section    __TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0    sdk_version 13, 3
.globl    _customFunction                 ; -- Begin function customFunction
.p2align    2
_customFunction:                        ; @customFunction
.cfi_startproc
; Calculate temp = int1 + 4 - 2 directly in w0 (int1's register)
add    w0, w0, #2

; Convert temp (w0) to double and store in d2
scvtf    d2, w0

; Calculate *outDouble = double2 + temp - 1.0
fadd    d2, d2, d1
fmov    d3, #1.00000000
fsub    d2, d2, d3

; Store the result in *outDouble
str    d2, [x3]

; Return
ret
.cfi_endproc
; -- End function
.subsections_via_symbols
