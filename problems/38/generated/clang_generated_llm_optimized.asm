    .section	__TEXT,__text,regular,pure_instructions
    .build_version macos, 13, 0	sdk_version 13, 3
    .globl	_customFunction                 ; -- Begin function customFunction
    .p2align	2
_customFunction:                        ; @customFunction
    .cfi_startproc

    ; Integer addition
    add	w4, w0, w1                  ; w4 = int1 + int2
    str	w4, [x2]                    ; Store result to outInt

    ; Floating-point addition
    fadd	d2, d0, d1                  ; d2 = double1 + double2
    str	d2, [x3]                    ; Store result to outDouble

    ret

    .cfi_endproc
    ; -- End function
.subsections_via_symbols
