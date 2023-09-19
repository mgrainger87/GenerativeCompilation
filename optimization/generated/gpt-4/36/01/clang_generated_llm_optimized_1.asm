//solution_number=1,compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section    __TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0    sdk_version 13, 3
.section    __TEXT,__literal8,8byte_literals
.p2align    3
lCPI0_0:
.quad    0x3ff199999999999a              ; double 1.1000000000000001
.section    __TEXT,__text,regular,pure_instructions
.globl    _customFunction
.p2align    2
_customFunction:                        ; @customFunction
.cfi_startproc
; %bb.0:
add    w8, w0, #5                      ; directly adding 5 to int1
str    w8, [x2]                        ; directly storing to outInt pointer
adrp    x9, lCPI0_0@PAGE
ldr    d9, [x9, lCPI0_0@PAGEOFF]
fmul    d9, d0, d9                      ; multiplying double1 by 1.1
str    d9, [x3]                        ; directly storing to outDouble pointer
ret
.cfi_endproc
.subsections_via_symbols
