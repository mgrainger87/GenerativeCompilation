    .section    __TEXT,__text,regular,pure_instructions
    .build_version macos, 13, 0    sdk_version 13, 3
    .globl    _customFunction                 ; -- Begin function customFunction
    .p2align    2
_customFunction:                        ; @customFunction
    .cfi_startproc
; %bb.0:
    lsl    w8, w1, #1                      ; Multiply int2 by 2
    add    w8, w8, w0                      ; Add int1 to the result
    str    w8, [x2]                        ; Store the integer result to *outInt

    str    d0, [x3]                        ; Store double1 to *outDouble

    ret
    .cfi_endproc
                                        ; -- End function
.subsections_via_symbols
