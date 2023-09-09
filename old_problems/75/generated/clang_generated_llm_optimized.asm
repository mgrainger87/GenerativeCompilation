    .section    __TEXT,__text,regular,pure_instructions
    .build_version macos, 13, 0    sdk_version 13, 3
    .globl    _customFunction                 ; -- Begin function customFunction
    .p2align    2
_customFunction:                        ; @customFunction
    .cfi_startproc
    ; Simply add w0 (int1) and w1 (int2)
    add    w8, w0, w1
    ; Store the result to the address in x2 (outInt)
    str    w8, [x2]
    ret
    .cfi_endproc
                                        ; -- End function
    .subsections_via_symbols
