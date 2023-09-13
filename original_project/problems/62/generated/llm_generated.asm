    .section    __TEXT,__text,regular,pure_instructions
    .globl    _customFunction
    .align    2
_customFunction:
    // Save the callee-saved registers
    stp x19, x20, [sp, #-16]!
    
    // Initialize result to 0
    fmov d19, #0.0
    
    // Initialize loop counter i to 0
    mov w20, #0
    
1:  // Start of loop
    // Check if i < 4
    cmp w20, #4
    b.ge 2f
    
    // result += double1
    fadd d19, d19, d0
    
    // i++
    add w20, w20, #1
    
    // Loop back
    b 1b
    
2:  // End of loop
    
    // *outInt = int1 + int2
    add w0, w0, w1
    str w0, [x2]
    
    // *outDouble = result
    str d19, [x3]
    
    // Restore the callee-saved registers
    ldp x19, x20, [sp], #16
    
    // Return
    ret
