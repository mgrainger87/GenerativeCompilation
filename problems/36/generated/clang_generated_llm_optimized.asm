    .section    __TEXT,__text,regular,pure_instructions
    .build_version macos, 13, 0    sdk_version 13, 3
    .globl    _customFunction                 ; -- Begin function customFunction
    .p2align    2
_customFunction:                            ; @customFunction
    .cfi_startproc
; %bb.0:
    ; Directly store int1 (x0) to the memory location pointed to by outInt (x2)
    str    w0, [x2]

    ; Directly store double1 (d0) to the memory location pointed to by outDouble (x3)
    str    d0, [x3]

    ret
    .cfi_endproc
                                        ; -- End function
.subsections_via_symbols
