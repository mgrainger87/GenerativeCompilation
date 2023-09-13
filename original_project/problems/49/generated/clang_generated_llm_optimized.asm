    .section    __TEXT,__text,regular,pure_instructions
    .build_version macos, 13, 0    sdk_version 13, 3
    .globl    _customFunction                 ; -- Begin function customFunction
    .p2align    2
_customFunction:                        ; @customFunction
    .cfi_startproc
    ; For the integer addition
    add    w8, w0, w0          ; int1 + int1
    str    w8, [x2]           ; *outInt = result

    ; For the floating-point addition
    fadd   d0, d0, d0         ; double1 + double1
    str    d0, [x3]           ; *outDouble = result

    ret
    .cfi_endproc
                                        ; -- End function
.subsections_via_symbols
