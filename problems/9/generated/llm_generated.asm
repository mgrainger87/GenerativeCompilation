    .section    __TEXT,__text,regular,pure_instructions
    .globl    _customFunction
    .align    3
_customFunction:
    // Prologue
    stp     x29, x30, [sp, #-16]!  // Save frame pointer and link register
    mov     x29, sp               // Set frame pointer

    // int1 + int2 (result in x4)
    add     x4, x0, x1

    // int1 + int2 (result in x5, but this is redundant)
    add     x5, x0, x1

    // sum1 - sum2 (result in x6)
    sub     x6, x4, x5

    // Store result of subtraction to *outInt
    str     x6, [x2]

    // double1 * double2 (result in d2)
    fmul    d2, d0, d1

    // Store result of multiplication to *outDouble
    str     d2, [x3]

    // Epilogue
    ldp     x29, x30, [sp], #16   // Restore frame pointer and link register
    ret
