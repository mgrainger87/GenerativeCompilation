.global _customFunction

_customFunction:
    // Preserve the values of caller-saved and/or callee-saved registers
    // We'll be using x8, x9 as temporary registers, so let's save them
    stp x8, x9, [sp, #-16]!  // Pre-decrement stack pointer to save space for 2 registers
    
    // int temp = int1 + 4 - 2;
    // Using w8 as a temporary register for integer calculations
    add w8, w0, #2  // w8 = w0 + 2
    
    // *outDouble = double2 + temp - 1.0;
    // Convert the integer temp to a double, and store it in d2
    scvtf d2, w8
    
    // Add double2 (d1) to the converted temp (d2)
    fadd d2, d1, d2
    
    // Subtract 1.0 from the result
    // ARM64 does not allow direct floating-point literals with the fadd instruction
    // So, we'll load 1.0 into d3 and then use it
    // Note: We're assuming a location labeled 1f that contains the value 1.0
    ldr d3, 1f
    fsub d2, d2, d3
    
    // Store the result into *outDouble
    str d2, [x3]
    
    // Restore the saved registers
    ldp x8, x9, [sp], #16  // Post-increment stack pointer to restore the original SP
    
    ret

1:
    .double 1.0
