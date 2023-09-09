    .globl  _customFunction
    .align  2
_customFunction:
    // *outInt = (int2 * 8) - int2;
    lsl     w4, w1, #3      // w4 = int2 * 8
    sub     w4, w4, w1      // w4 = w4 - int2
    str     w4, [x2]        // Store w4 to *outInt

    // *outDouble = (double1 * 4) - double1;
    fmov    d2, #4.0        // Load 4.0 into d2
    fmul    d2, d0, d2      // d2 = double1 * 4
    fsub    d2, d2, d0      // d2 = d2 - double1
    str     d2, [x3]        // Store d2 to *outDouble

    ret
