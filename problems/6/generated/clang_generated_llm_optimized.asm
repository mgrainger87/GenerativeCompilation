    .section    __TEXT,__text,regular,pure_instructions
    .build_version macos, 13, 0    sdk_version 13, 3
    .globl    _customFunction                 ; -- Begin function customFunction
    .p2align    2
_customFunction:                        ; @customFunction
    .cfi_startproc

; Calculate the integer product and store it to outInt
    mul    w8, w0, w1        ; product = int1 * int2
    add    w8, w8, w8        ; product + product
    str    w8, [x2]          ; *outInt = product + product

; Add the double values and store it to outDouble
    fadd   d0, d0, d1        ; double1 + double2
    str    d0, [x3]          ; *outDouble = double1 + double2

    ret

    .cfi_endproc
                                        ; -- End function
.subsections_via_symbols
