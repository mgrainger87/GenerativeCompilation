    .section    __TEXT,__text,regular,pure_instructions
    .build_version macos, 13, 0    sdk_version 13, 3
    .globl    _customFunction
    .p2align    2
_customFunction:                        ; @customFunction
    .cfi_startproc
; %bb.0:

    ; For *outInt = int1 * 6;
    lsl     w8, w0, #2         ; w8 = int1 * 4
    add     w8, w8, w0, lsl #1 ; w8 = w8 + int1 * 2 = int1 * 6
    str     w8, [x2]           ; *outInt = w8

    ; For *outDouble = double1 * 8;
    fmov    d1, #8.00000000
    fmul    d0, d0, d1         ; d0 = double1 * 8
    str     d0, [x3]           ; *outDouble = d0

    ret
    .cfi_endproc
    .subsections_via_symbols
