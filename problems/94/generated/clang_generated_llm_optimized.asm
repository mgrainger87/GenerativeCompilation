    .section    __TEXT,__text,regular,pure_instructions
    .build_version macos, 13, 0    sdk_version 13, 3
    .section    __TEXT,__literal8,8byte_literals
    .p2align    3
lCPI0_0:
    .quad    0x3ff6666666666666              ; double 1.3999999999999999
    .section    __TEXT,__text,regular,pure_instructions
    .globl    _customFunction
    .p2align    2
_customFunction:                        ; @customFunction
    .cfi_startproc
; %bb.0:
    sub    w8, w1, #8               ; Subtract 8 from int2
    str    w8, [x2]                ; Store result to *outInt
    adrp   x9, lCPI0_0@PAGE
    ldr    d2, [x9, lCPI0_0@PAGEOFF]
    fmul   d2, d1, d2              ; Multiply double2 by 1.4
    str    d2, [x3]                ; Store result to *outDouble
    ret
    .cfi_endproc
