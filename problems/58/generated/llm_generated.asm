    .section    __TEXT,__text,regular,pure_instructions
    .globl    _customFunction
    .align    2
_customFunction:
    // *outInt = (int1 * 5) + (int1 * 2);
    mov     w4, #5             // Load immediate value 5 into w4
    mul     w4, w0, w4         // Multiply w0 (int1) by 5 and store in w4
    lsl     w5, w0, #1         // Shift w0 (int1) left by 1, which is equivalent to multiplying by 2
    add     w4, w4, w5         // Add w4 and w5 and store result in w4
    str     w4, [x2]           // Store w4 (result) into memory at address in x2 (outInt)

    // *outDouble = (double1 * 6) + (double1 * 1);
    fmov    d2, #6.0           // Load immediate value 6.0 into d2
    fmul    d2, d0, d2         // Multiply d0 (double1) by 6.0 and store in d2
    fadd    d2, d2, d0         // Add d0 (double1) to d2 and store result in d2
    str     d2, [x3]           // Store d2 (result) into memory at address in x3 (outDouble)

    ret                         // Return
