    .section    __TEXT,__text,regular,pure_instructions
    .globl    _customFunction
    .p2align    2
_customFunction:
    // The function does not call any other functions, so we do not need to save any caller-saved registers.

    // Calculate (int1 * 3) + (int1 * 2) + int1
    // We can optimize this to int1 * 6
    lsl    w4, w0, #2       // w4 = int1 * 4
    add    w4, w4, w0       // w4 = int1 * 5
    add    w4, w4, w0       // w4 = int1 * 6

    // Store the result to *outInt
    str    w4, [x2]

    // Calculate (double1 * 4) + (double1 * 3) + double1
    // We can optimize this to double1 * 8
    fmov    d4, #8.0        // Load 8.0 into d4
    fmul    d4, d4, d0      // d4 = double1 * 8

    // Store the result to *outDouble
    str    d4, [x3]

    ret
