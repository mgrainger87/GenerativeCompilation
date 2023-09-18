//solution_number=4,compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.section    __TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0    sdk_version 13, 3
.section    __TEXT,__literal8,8byte_literals
.p2align    3
lCPI0_0:
.quad    0x3ffe666666666666              ; double 1.8999999999999999
.section    __TEXT,__text,regular,pure_instructions
.globl    _customFunction
.p2align    2
_customFunction:                        ; @customFunction
.cfi_startproc

; Multiplying int1 by 9 and storing directly to *outInt
lsl     w8, w0, #3       ; w8 = w0 * 8 (logical shift left by 3 is equivalent to multiplying by 8)
add     w0, w0, w8       ; w0 = w0 + w8 (w0 = w0 + w0 * 8 = w0 * 9)
str     w0, [x2]

; Multiplying double1 by 1.9 and storing directly to *outDouble
adrp    x8, lCPI0_0@PAGE
ldr     d1, [x8, lCPI0_0@PAGEOFF]
fmul    d0, d0, d1
str     d0, [x3]

ret
.cfi_endproc
; -- End function
.subsections_via_symbols
