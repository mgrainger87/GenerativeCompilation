    .section    __TEXT,__text,regular,pure_instructions
    .build_version macos, 13, 0    sdk_version 13, 3
    .globl    _customFunction                 ; -- Begin function customFunction
    .p2align    2
_customFunction:                        ; @customFunction
    .cfi_startproc
    
    ; First iteration
    str    d0, [x3]
    ; Second iteration
    str    d0, [x3]
    
    ret
    .cfi_endproc
    .subsections_via_symbols
