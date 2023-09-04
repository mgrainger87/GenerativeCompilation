.global _customFunction
_customFunction:
    // Align the function for ARM64
    .align 2
    
    // int temp = int2 - 15;
    sub w4, w1, #15
    
    // *outInt = b;
    str w4, [x2]
    
    // Load the constant 1.8 into d5
    adrp x5, .Ldouble_constant@PAGE
    ldr  d5, [x5, .Ldouble_constant@PAGEOFF]
    fmul d6, d1, d5
    
    // *outDouble = y;
    str d6, [x3]
    
    ret

    // Ensure 8-byte alignment for the double constant
    .align 3
.Ldouble_constant:
    .double 1.8
