    .globl  _customFunction
    .align  2
_customFunction:
    // Store the caller-saved registers that we plan to use
    stp     x8, x9, [sp, #-16]!

    // Compute int1 * int2
    mul     x8, x0, x1

    // Compute int1 * int2 + int1
    add     x9, x8, x0

    // Store the result to *outInt
    str     w9, [x2]

    // Compute double1 * double2
    fmul    d8, d0, d1

    // Compute double1 * double2 + double1
    fadd    d8, d8, d0

    // Store the result to *outDouble
    str     d8, [x3]

    // Restore the caller-saved registers
    ldp     x8, x9, [sp], #16

    ret
