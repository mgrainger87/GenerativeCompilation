    .globl  _customFunction
    .align  2
_customFunction:
    // int var1 = int1 * 2;
    lsl     w4, w0, #1              // w4 = x0 * 2

    // int var2 = int2 * 3;
    add     w5, w1, w1              // w5 = x1 * 2
    add     w5, w5, w1              // w5 = w5 + x1 (x1 * 3)

    // double var3 = double1 / 2;
    fmov    d2, #2.0                // d2 = 2.0
    fdiv    d3, d0, d2              // d3 = d0 / d2

    // *outInt = int1 + int2;
    add     w6, w0, w1              // w6 = x0 + x1
    str     w6, [x2]                // store w6 to *outInt

    // *outDouble = double1 + double2;
    fadd    d4, d0, d1              // d4 = d0 + d1
    str     d4, [x3]                // store d4 to *outDouble

    ret
