//solution_number=4,compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section    __TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0    sdk_version 13, 3
.globl    _customFunction                 ; -- Begin function customFunction
.p2align    2
_customFunction:                        ; @customFunction
.cfi_startproc
; %bb.0:

; Compute *outInt = int1 + int2;
add    w0, w0, w1
str    w0, [x2]

; Compute *outDouble = double1 + double2;
fadd    d0, d0, d1
str    d0, [x3]

ret
.cfi_endproc
; -- End function
.subsections_via_symbols
