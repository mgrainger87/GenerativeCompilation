    .globl  _customFunction
    .align  2
_customFunction:
    // int a = int2 * 10;
    mov     w4, #10          // Load the immediate value 10 into w4
    mul     w4, w4, w1       // Multiply int2 (w1) by 10 and store the result in w4

    // int b = a;
    mov     w5, w4           // Move value of a (w4) into b (w5)

    // *outInt = b;
    str     w5, [x2]         // Store the value of b (w5) at the address pointed by outInt (x2)

    // double x = double2 * 2.0;
    fmov    d2, #2.0         // Load the floating-point immediate value 2.0 into d2
    fmul    d2, d2, d1       // Multiply double2 (d1) by 2.0 and store the result in d2

    // double y = x;
    fmov    d3, d2           // Move the value of x (d2) into y (d3)

    // *outDouble = y;
    str     d3, [x3]         // Store the value of y (d3) at the address pointed by outDouble (x3)

    ret                     // Return from the function
