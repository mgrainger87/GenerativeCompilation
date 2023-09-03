    .section    __TEXT,__text,regular,pure_instructions
    .build_version macos, 13, 0    sdk_version 13, 3
    .section    __TEXT,__literal8,8byte_literals
    .p2align    3
lCPI0_0:
    .quad    0x3ff3333333333333              ; double 1.2
    .section    __TEXT,__text,regular,pure_instructions
    .globl    _customFunction
    .p2align    2
_customFunction:                        ; @_customFunction
    .cfi_startproc
    ; Compute int2 - 3 and store in *outInt
    subs    w8, w1, #3
    str    w8, [x2]

    ; Compute double2 * 1.2 and store in *outDouble
    adrp    x9, lCPI0_0@PAGE
    ldr    d2, [x9, lCPI0_0@PAGEOFF]
    fmul    d0, d1, d2
    str    d0, [x3]
    
    ret
    .cfi_endproc
