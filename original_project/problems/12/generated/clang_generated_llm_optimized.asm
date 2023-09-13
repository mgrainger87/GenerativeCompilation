    .section    __TEXT,__text,regular,pure_instructions
    .build_version macos, 13, 0    sdk_version 13, 3
    .section    __TEXT,__literal8,8byte_literals
    .p2align    3                               ; -- Begin function customFunction
    
lCPI0_0:
    .quad    0x3fb999999999999a              ; double 0.10000000000000001
lCPI0_1:
    .quad    0x3ff199999999999a              ; double 1.1000000000000001

    .section    __TEXT,__text,regular,pure_instructions
    .globl    _customFunction
    .p2align    2
_customFunction:                        ; @customFunction
    .cfi_startproc

    ; Load the constants into d2 and d3
    adrp    x8, lCPI0_1@PAGE
    ldr     d2, [x8, lCPI0_1@PAGEOFF]
    adrp    x8, lCPI0_0@PAGE
    ldr     d3, [x8, lCPI0_0@PAGEOFF]

    ; Calculate double1 + 1.1
    fadd    d2, d0, d2
    ; Calculate (double1 + 1.1) + double2
    fadd    d2, d2, d1
    ; Calculate (double1 + 1.1 + double2) - 0.1
    fsub    d2, d2, d3

    ; Store the result to *outDouble
    str     d2, [x3]

    ret
    .cfi_endproc
                                        ; -- End function
.subsections_via_symbols
