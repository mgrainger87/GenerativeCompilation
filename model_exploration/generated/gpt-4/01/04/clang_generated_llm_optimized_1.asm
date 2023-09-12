//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section    __TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0    sdk_version 13, 3
.globl    _customFunction                 ; -- Begin function customFunction
.p2align    2
_customFunction:                        ; @customFunction
.cfi_startproc
; %bb.0:
str    w0, [x2]    ; store int1 into *outInt
str    d0, [x3]    ; store double1 into *outDouble
ret
.cfi_endproc
; -- End function
.subsections_via_symbols
