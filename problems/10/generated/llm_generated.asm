    .section    __TEXT,__text,regular,pure_instructions
    .align      2
    
    .globl      _customFunction
    .p2align    2
_customFunction:
    // Save the link register to the stack
    str         lr, [sp, #-16]!
    
    // Calculate the int result
    add         w4, w0, w1        // w4 = int1 + int2
    mul         w4, w4, wzr       // w4 = (int1 + int2) * 0
    add         w4, w4, w1        // w4 = ((int1 + int2) * 0) + int2
    str         w4, [x2]          // *outInt = w4
    
    // Calculate the double result
    fadd        d4, d0, d1        // d4 = double1 + double2
    fsub        d5, d0, d1        // d5 = double1 - double2
    fmul        d4, d4, d5        // d4 = (double1 + double2) * (double1 - double2)
    str         d4, [x3]          // *outDouble = d4
    
    // Restore the link register and return
    ldr         lr, [sp], #16
    ret
