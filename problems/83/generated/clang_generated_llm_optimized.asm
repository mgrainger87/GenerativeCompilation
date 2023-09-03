    .section    __TEXT,__text,regular,pure_instructions
    .build_version macos, 13, 0    sdk_version 13, 3
    .globl    _customFunction
    .p2align    2
_customFunction:                        
    .cfi_startproc
    ; Integer calculations
    lsl    w8, w0, #1          ; Multiply int1 by 2
    str    w8, [x2]            ; Store the result to *outInt

    ; Double calculations
    fmov    d1, #0.5            ; Load 0.5 to d1
    fmul    d0, d0, d1          ; Multiply double1 by 0.5
    str    d0, [x3]            ; Store the result to *outDouble

    ret
    .cfi_endproc
