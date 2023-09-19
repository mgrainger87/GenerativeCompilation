//solution_number=1,compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section    __TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0    sdk_version 13, 3
.globl    _customFunction                 ; -- Begin function customFunction
.p2align    2
_customFunction:                        ; @customFunction
.cfi_startproc
; %bb.0:
str    w1, [x2]  ; Store int2 into *outInt
fadd    d0, d0, d1  ; Add double1 and double2
str    d0, [x3]  ; Store result into *outDouble
ret
.cfi_endproc
; -- End function
.subsections_via_symbols
