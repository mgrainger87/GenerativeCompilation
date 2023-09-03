    .section    __TEXT,__text,regular,pure_instructions
    .build_version macos, 13, 0    sdk_version 13, 3
    .globl    _customFunction
    .p2align    2
_customFunction:                        ; @customFunction
    .cfi_startproc
    ; Calculate *outInt = int1 * (int2 + 3)
    add    w1, w1, #3
    mul    w0, w0, w1
    str    w0, [x2]

    ; Calculate *outDouble = double1 * (double2 + 1.5)
    fmov   d2, #1.5
    fadd   d1, d1, d2
    fmul   d0, d0, d1
    str    d0, [x3]

    ret
    .cfi_endproc
