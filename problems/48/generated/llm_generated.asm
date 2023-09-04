.global _customFunction
.align 2

_customFunction:
    // Save frame pointer and link register
    stp x29, x30, [sp, #-16]!
    mov x29, sp

    // Calculate int1 * int1 and store in x4
    mul x4, x0, x0

    // Calculate int1 * int1 * int1 and store in x5
    mul x5, x4, x0

    // Calculate int1 * int1 * int1 * int1 and store in x6
    mul x6, x5, x0

    // Store result to outInt
    str x6, [x2]

    // Calculate double1 * double1 and store in d2
    fmul d2, d0, d0

    // Calculate double1 * double1 * double1 and store in d3
    fmul d3, d2, d0

    // Calculate double1 * double1 * double1 * double1 and store in d4
    fmul d4, d3, d0

    // Store result to outDouble
    str d4, [x3]

    // Restore frame pointer and link register
    ldp x29, x30, [sp], #16
    ret
