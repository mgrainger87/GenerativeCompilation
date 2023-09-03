    .section    __TEXT,__text,regular,pure_instructions
    .build_version macos, 13, 0    sdk_version 13, 3
    .globl    _customFunction                 ; -- Begin function customFunction
    .p2align    2
_customFunction:                        ; @customFunction
    .cfi_startproc
; %bb.0:
    mov    w8, #7                         ; Load immediate value 7 into w8
    mul    w8, w8, w0                     ; Multiply int1 (w0) with 7
    str    w8, [x2]                       ; Store the result to *outInt

    fmov    d1, #7.00000000               ; Load floating-point value 7.0 into d1
    fmul    d0, d0, d1                    ; Multiply double1 (d0) with 7.0
    str    d0, [x3]                       ; Store the result to *outDouble

    ret
    .cfi_endproc
                                        ; -- End function
.subsections_via_symbols
