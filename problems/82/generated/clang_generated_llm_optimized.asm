    .section    __TEXT,__text,regular,pure_instructions
    .build_version macos, 13, 0    sdk_version 13, 3
    .globl    _customFunction                 ; -- Begin function customFunction
    .p2align    2
_customFunction:                            ; @customFunction
    .cfi_startproc
; %bb.0:
    ; Integer operations
    add    w8, w0, w1    ; w8 = int1 + int2 (This is equivalent to b)
    add    w8, w8, w1    ; w8 = w8 + int2 (Resultant operation for *outInt)
    str    w8, [x2]      ; *outInt = w8

    ; Floating-point operations
    fsub   d8, d0, d1    ; d8 = double1 - double2 (This is equivalent to y)
    fadd   d8, d8, d0    ; d8 = d8 + double1 (Resultant operation for *outDouble)
    str    d8, [x3]      ; *outDouble = d8

    ret
    .cfi_endproc
                                        ; -- End function
.subsections_via_symbols
