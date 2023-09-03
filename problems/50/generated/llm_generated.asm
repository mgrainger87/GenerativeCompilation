    .globl  _customFunction
    .align  2
_customFunction:
    // The multiplication of int1 by (1/3) should be 0 unless int1 is 3.
    // If int1 is 3, the result should be 1. For all other values of int1, the result should be 0.

    cmp x0, #3     // Check if int1 is 3
    cset x4, eq    // If equal, set x4 to 1, otherwise set to 0

    // Store the result to *outInt
    str w4, [x2]

    // For the double multiplication:
    // *outDouble = double1 * 0.25;
    // We'll use an fmul instruction.

    fmov d2, #0.25   // Load 0.25 into d2
    fmul d2, d0, d2  // Multiply double1 by 0.25
    str d2, [x3]     // Store the result to *outDouble

    ret              // Return from the function
