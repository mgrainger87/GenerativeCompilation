//solution_number=2,compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.section    __TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0    sdk_version 13, 3
.section    __TEXT,__literal8,8byte_literals
.p2align    3                               ; -- Begin function customFunction
lCPI0_0:
.quad    0x3ff4cccccccccccd              ; double 1.3
.section    __TEXT,__text,regular,pure_instructions
.globl    _customFunction
.p2align    2
_customFunction:                        ; @customFunction
.cfi_startproc
; %bb.0:
add w0, w0, #10    ; temp = int1 + 10
str w0, [x2]       ; *outInt = temp

adrp    x8, lCPI0_0@PAGE
ldr    d1, [x8, lCPI0_0@PAGEOFF]
fmul    d0, d0, d1
str    d0, [x3]    ; *outDouble = double1 * 1.3

ret
.cfi_endproc
; -- End function
.subsections_via_symbols
