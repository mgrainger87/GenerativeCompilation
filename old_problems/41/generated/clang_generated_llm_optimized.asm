    .section    __TEXT,__text,regular,pure_instructions
    .build_version macos, 13, 0    sdk_version 13, 3
    .globl    _customFunction                 ; -- Begin function customFunction
    .p2align    2
_customFunction:                        ; @customFunction
    .cfi_startproc
; %bb.0:

    ; For *outInt = int1 * 8;
    lsl    w8, w0, #3        ; int1 is in w0, multiply it by 8 using logical shift left
    str    w8, [x2]          ; store the result in *outInt (x2 holds the address of outInt)

    ; For *outDouble = double2 * 16.0;
    fmov    d0, #16.00000000 ; load the constant 16.0 into d0
    fmul    d0, d0, d1       ; multiply double2 (in d1) by 16.0
    str    d0, [x3]          ; store the result in *outDouble (x3 holds the address of outDouble)

    ret
    .cfi_endproc
                                    ; -- End function
.subsections_via_symbols
