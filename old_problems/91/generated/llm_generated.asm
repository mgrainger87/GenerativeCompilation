    .text
    .global _customFunction
    .align  2

_customFunction:
    // int a = int1 + 5;
    add w4, w0, #5  // w4 = w0 + 5

    // int b = a;
    mov w5, w4      // w5 = w4

    // *outInt = b;
    str w5, [x2]

    // Load the floating-point constant 1.1 for multiplication
    ldr d6, 1f

    fmul d7, d0, d6     // d7 = d0 * d6 (1.1)

    // double y = x;
    fmov d8, d7         // d8 = d7

    // *outDouble = y;
    str d8, [x3]

    ret

    .align 3
1:
    .double 1.1
