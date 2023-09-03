    .section    __TEXT,__text,regular,pure_instructions
    .build_version macos, 13, 0    sdk_version 13, 3
    .globl    _customFunction                 ; -- Begin function customFunction
    .p2align    2
_customFunction:                        ; @customFunction
    .cfi_startproc
    ; Multiply int2 by 4
    lsl    w8, w1, #2
    ; Store the result in outInt
    str    w8, [x2]

    ; Multiply double2 by 0.75
    fmov   d2, #0.75000000
    fmul   d0, d1, d2
    ; Store the result in outDouble
    str    d0, [x3]

    ret
    .cfi_endproc
    ; -- End function
.subsections_via_symbols
