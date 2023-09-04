    .global _customFunction
    .align 4

_customFunction:
    // Multiply int1 by 8
    lsl x4, x0, 3

    // Store the result to the location pointed by outInt
    str w4, [x2]

    // Multiply double2 by 16.0
    // Load the constant 16.0 into d2 and use it for multiplication.
    adrp x5, double2_16x@PAGE
    ldr  d2, [x5, double2_16x@PAGEOFF]
    fmul d3, d1, d2

    // Store the result to the location pointed by outDouble
    str d3, [x3]

    // Return
    ret

    // Data section for the constant 16.0
    .section __DATA,__data
double2_16x:
    .double 16.0
