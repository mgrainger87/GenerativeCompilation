    .globl  _customFunction
    .align  2
_customFunction:
    // Multiply int1 by 3
    lsl     w4, w0, 1         // w4 = int1 * 2
    add     w4, w4, w0        // w4 = int1 * 3, w4 now contains value of 'a' and 'b'

    // Store the result to *outInt
    str     w4, [x2]

    // Multiply double2 by 0.25
    fmov    d2, #0.25         // Load 0.25 into d2
    fmul    d2, d2, d1        // d2 = double2 * 0.25, d2 now contains value of 'x' and 'y'

    // Store the result to *outDouble
    str     d2, [x3]

    ret
