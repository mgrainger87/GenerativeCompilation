    .globl  _customFunction
    .align  2
_customFunction:
    // Saving the registers (if necessary). In this case, there are no callee-saved registers used.

    // *outInt = int1 * (4 + 4);
    mov     w8, #8          // Load immediate value 8 into w8 register
    mul     w8, w8, w0      // Multiply x0 (int1) with 8
    str     w8, [x2]        // Store the result into memory pointed by x2 (outInt)

    // *outDouble = double2 * (8 + 8);
    fmov    d8, #16.0       // Move immediate value 16.0 into d8 register
    fmul    d8, d8, d1      // Multiply d1 (double2) with 16.0
    str     d8, [x3]        // Store the result into memory pointed by x3 (outDouble)

    ret                     // Return from the function
