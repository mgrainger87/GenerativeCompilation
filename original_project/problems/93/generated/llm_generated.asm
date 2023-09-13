.global _customFunction
_customFunction:
    // int temp = int1 + 10;
    add     x4, x0, #10           // x4 = x0 + 10
    
    // *outInt = b;
    str     w4, [x2]

    // Load floating point constant 1.3 to d1
    movz    x5, #0x3FF4, lsl #48
    movk    x5, #0xCCCC, lsl #32
    movk    x5, #0xCCCC, lsl #16
    movk    x5, #0xCCCC
    fmov    d1, x5

    // double tempD = double1 * 1.3;
    fmul    d2, d0, d1            // d2 = d0 * d1

    // *outDouble = y;
    str     d2, [x3]

    ret
