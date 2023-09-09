    .section    __TEXT,__text,regular,pure_instructions
    .build_version macos, 13, 0    sdk_version 13, 3
    .globl    _customFunction                 ; -- Begin function customFunction
    .p2align    2
_customFunction:                        ; @customFunction
    .cfi_startproc
    ; %bb.0:
    add    w8, w0, #5      ; w8 = int1 + 5
    add    w9, w1, #3      ; w9 = int2 + 3
    mul    w8, w8, w9      ; w8 = (int1 + 5) * (int2 + 3)
    str    w8, [x2]        ; store result in outInt
    ret
    .cfi_endproc
                                        ; -- End function
.subsections_via_symbols
