    .section    __TEXT,__text,regular,pure_instructions
    .globl    _customFunction
    .align    2
_customFunction:
    // Save callee-saved registers (none needed in this case)
    
    // Calculating (int1 * 6) * 0.5
    // As ARM64 does not allow direct floating-point literals with the fadd instruction
    // we'll multiply by 3 instead of multiplying by 6 and then multiplying by 0.5
    ldr     w8, =3         // Load constant 3 into w8
    mul     w8, w8, w0     // Multiply int1 (x0) by 3
    str     w8, [x2]       // Store the result at the address pointed to by outInt (x2)

    // Calculating (double1 * 8) * 0.25
    // Again, we'll multiply by 2 instead of multiplying by 8 and then multiplying by 0.25
    fmov    d8, #2.0       // Load constant 2.0 into d8
    fmul    d8, d8, d0     // Multiply double1 (d0) by 2
    str     d8, [x3]       // Store the result at the address pointed to by outDouble (x3)
    
    // Restore callee-saved registers (none needed in this case)
    ret
