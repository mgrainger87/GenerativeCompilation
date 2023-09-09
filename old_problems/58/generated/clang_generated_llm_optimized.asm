.section    __TEXT,__text,regular,pure_instructions
.build_version macos, 13, 0    sdk_version 13, 3
.globl    _customFunction                 ; -- Begin function customFunction
.p2align    2
_customFunction:                        ; @customFunction
    .cfi_startproc
; %bb.0:
    ; Calculating (int1 * 7)
    mov    w8, #7
    mul    w8, w0, w8
    str    w8, [x2]

    ; Calculating (double1 * 7)
    fmov    d1, #7.00000000
    fmul    d0, d0, d1
    str    d0, [x3]

    ret
    .cfi_endproc
                                        ; -- End function
.subsections_via_symbols
