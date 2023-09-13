    .section    __TEXT,__text,regular,pure_instructions
    .build_version macos, 13, 0	sdk_version 13, 3
    .globl    _customFunction
    .p2align    2
_customFunction:                        ; @customFunction
    .cfi_startproc

    // Check if int1 > 10
    cmp     x0, #10
    ble     .Lelse_part  // If int1 <= 10, jump to else part

    // Check if int2 < 5
    cmp     x1, #5
    bge     .Lend_if

    // No need to calculate and store tmp since it's unused
    // Continue to .Lend_if

.Lend_if:
    b       .Lafter_if

.Lelse_part:
    // *outInt = int1 + int2
    add     w8, w0, w1
    str     w8, [x2]

.Lafter_if:
    // *outDouble = double1 + double2
    fadd    d0, d0, d1
    str     d0, [x3]
    ret

    .cfi_endproc
