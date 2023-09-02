    .section    __TEXT,__text,regular,pure_instructions
    .build_version macos, 13, 0    sdk_version 13, 3
    .globl    _customFunction                 ; -- Begin function customFunction
    .p2align    2
_customFunction:                        ; @customFunction
    .cfi_startproc
    ; Calculate base value
    add w9, w0, w0                 ; w9 = int1 * 2
    asr w10, w1, #1                ; w10 = int2 / 2 using arithmetic shift right
    add w9, w9, w10                ; w9 now holds the value of 'base'

    ; Check if base is greater than 10 and update *outInt accordingly
    cmp w9, #10
    ble    1f  ; Use numeric local label

    ; True branch: *outInt = base + int1 - int2
    add w9, w9, w0
    sub w9, w9, w1
    str w9, [x2]
    b    2f  ; Jump to the end of if-else

1:  ; False branch: *outInt = base - int1 + int2
    sub w9, w9, w0
    add w9, w9, w1
    str w9, [x2]

2:  ; End of if-else
    ; *outDouble = double1 + double2
    fadd d0, d0, d1
    str d0, [x3]

    ret
    .cfi_endproc
    ; -- End function
.subsections_via_symbols
