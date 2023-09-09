    .globl  _customFunction
    .align  3
_customFunction:
    // Preserve lr (Return Address) since we're not making any calls
    // Preserve callee-saved registers if necessary (Not needed here as we're not using any)
    
    // For *outInt = (int1 + int2 * 0) * 2;
    // Since int2 * 0 = 0, this is effectively int1 * 2
    lsl     x4, x0, #1           // x4 = int1 * 2
    str     x4, [x2]             // Store result in *outInt
    
    // For *outDouble = (double1 - double2 * 0.0) * 2.0;
    // Since double2 * 0.0 = 0.0, this is effectively double1 * 2.0
    fadd    d2, d0, d0           // d2 = double1 + double1 = double1 * 2.0
    str     d2, [x3]             // Store result in *outDouble
    
    ret
