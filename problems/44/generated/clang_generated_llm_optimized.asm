    .section    __TEXT,__text,regular,pure_instructions
    .build_version macos, 13, 0    sdk_version 13, 3
    .globl    _customFunction
    .p2align    2
_customFunction:
    .cfi_startproc
    ; Directly multiply x0 with itself and store the result to the address in x2
    mul    w8, w0, w0
    str    w8, [x2]

    ; Directly multiply d1 with itself and store the result to the address in x3
    fmul    d0, d1, d1
    str    d0, [x3]

    ret
    .cfi_endproc
