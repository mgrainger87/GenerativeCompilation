    .globl _customFunction
    .align  2
_customFunction:
    // Add int1 and int2
    add w4, w0, w1   // w4 will store the result of int1 + int2 (i.e., a)
    
    // b = a
    mov w5, w4       // w5 will store b
    
    // *outInt = b + int2
    add w5, w5, w1   // Add b and int2
    str w5, [x2]     // Store the result at the address pointed by outInt

    // Calculate x = double1 - double2
    fsub d4, d0, d1  // d4 will store the result of double1 - double2 (i.e., x)

    // y = x
    fmov d5, d4      // d5 will store y
    
    // *outDouble = y + double1
    fadd d5, d5, d0  // Add y and double1
    str d5, [x3]     // Store the result at the address pointed by outDouble
    
    ret
