    .section	__TEXT,__text,regular,pure_instructions
    .build_version macos, 13, 0 sdk_version 13, 3
    .globl	_customFunction
    .p2align	2
_customFunction:
    .cfi_startproc

    ; Optimize int calculation
    ; outInt = int1 * 6
    lsl     w1, w0, #2    ; w1 = int1 * 4
    add     w1, w1, w0, lsl #1  ; w1 = w1 + int1*2 = int1*6
    str     w1, [x2]     ; Store the result to outInt

    ; Optimize double calculation
    ; outDouble = double1 * 8
    fmov    d1, #8.0
    fmul    d0, d0, d1   ; d0 = double1 * 8
    str     d0, [x3]     ; Store the result to outDouble

    ret
    .cfi_endproc
