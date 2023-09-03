    .section    __TEXT,__text,regular,pure_instructions
    .globl    _customFunction
    .p2align    2
_customFunction:
    // Save lr
    str     x30, [sp, #-16]!
    
    // First branch based on condition (int1 > 10)
    cmp     x0, #10
    ble     .Lelse_part  // If int1 <= 10, jump to else part

    // Inner branch based on condition (int2 < 5)
    cmp     x1, #5
    bge     .Lend_if

    // tmp = int1 - int2 (even though tmp isn't used further)
    sub     x4, x0, x1

.Lend_if:
    b       .Lout_of_if  // Jump out of the if structure

.Lelse_part:
    // *outInt = int1 + int2
    add     x4, x0, x1
    str     x4, [x2]

.Lout_of_if:
    // *outDouble = double1 + double2
    fadd    d2, d0, d1
    str     d2, [x3]

    // Restore lr and return
    ldr     x30, [sp], #16
    ret
