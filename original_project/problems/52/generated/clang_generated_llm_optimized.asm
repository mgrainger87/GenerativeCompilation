    .section    __TEXT,__text,regular,pure_instructions
    .build_version macos, 13, 0   sdk_version 13, 3
    .globl    _customFunction
    .p2align    2
_customFunction:
    .cfi_startproc
    
    ; Calculate (int2 * 8) - int2 = int2 * 7
    lsl        w8, w1, #3         ; w8 = int2 * 8
    sub        w8, w8, w1         ; w8 = w8 - int2
    str        w8, [x2]           ; Store result to *outInt

    ; Calculate (double1 * 4) - double1 = double1 * 3
    fmov       d1, #3.00000000    ; Load 3.0 into d1
    fmul       d0, d0, d1         ; d0 = double1 * 3.0
    str        d0, [x3]           ; Store result to *outDouble

    ret
    .cfi_endproc
.subsections_via_symbols
