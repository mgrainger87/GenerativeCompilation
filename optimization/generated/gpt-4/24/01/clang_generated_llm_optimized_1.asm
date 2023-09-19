//solution_number=1,compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section    __TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0    sdk_version 13, 3
.globl    _customFunction                 ; -- Begin function customFunction
.p2align    2
_customFunction:                        ; @customFunction
.cfi_startproc
; %bb.0:
; Multiply int1 by 8 and store the result in *outInt
lsl    w0, w0, #3
str    w0, [x2]

; Multiply double2 by 16 and store the result in *outDouble
fmov   d0, #16.00000000
fmul   d0, d1, d0
str    d0, [x3]

ret
.cfi_endproc
; -- End function
.subsections_via_symbols
