    .section    __TEXT,__text,regular,pure_instructions
    .build_version macos, 13, 0    sdk_version 13, 3
    .globl    _customFunction                 ; -- Begin function customFunction
    .p2align    2
_customFunction:                        ; @customFunction
    .cfi_startproc
; %bb.0:
    ; Compute int1 * int2 once and store result in w8
    mul    w8, w0, w1

    ; Compute part1 = (int1 * int2) + int1 - int2
    add    w9, w8, w0
    sub    w9, w9, w1

    ; Compute part2 = (int1 * int2) - int1 + int2
    sub    w10, w8, w0
    add    w10, w10, w1

    ; Compute result int = part1 + part2 - int1 * int2
    add    w9, w9, w10
    sub    w9, w9, w8

    ; Store result to outInt
    str    w9, [x2]

    ; Compute result double = double1 + double2
    fadd    d0, d0, d1

    ; Store result to outDouble
    str    d0, [x3]

    ret
    .cfi_endproc
                                        ; -- End function
    .subsections_via_symbols
