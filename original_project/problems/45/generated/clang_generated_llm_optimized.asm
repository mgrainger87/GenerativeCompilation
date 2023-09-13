    .section    __TEXT,__text,regular,pure_instructions
    .build_version macos, 13, 0    sdk_version 13, 3
    .globl    _customFunction                 ; -- Begin function customFunction
    .p2align    2
_customFunction:                        ; @customFunction
    .cfi_startproc
; %bb.0:
    ; For int1 + int1 + int1 + int1 + int1, we can optimize it as int1 * 5
    mov w8, #5
    mul w8, w8, w0
    str w8, [x2]        ; Store result to outInt

    ; For double1 + double1 + double1 + double1 + double1 + double1, we can optimize it as double1 * 6
    fmov d1, #6.0
    fmul d0, d0, d1
    str d0, [x3]        ; Store result to outDouble

    ret
    .cfi_endproc
                                        ; -- End function
.subsections_via_symbols
