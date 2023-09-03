.section    __TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0    sdk_version 13, 3
.globl    _customFunction
.p2align    2
_customFunction:
    .cfi_startproc

    ; Compute int2 * 10
    mov    w8, #10
    mul    w8, w1, w8

    ; Store result in *outInt
    str    w8, [x2]

    ; Compute double2 * 2.0
    fmov   d2, #2.00000000
    fmul   d2, d1, d2

    ; Store result in *outDouble
    str    d2, [x3]

    ; Return
    ret

    .cfi_endproc
