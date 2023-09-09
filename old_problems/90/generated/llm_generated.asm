    .section    __TEXT,__text,regular,pure_instructions
    .align      2
    .globl      _customFunction
    .p2align    3
_customFunction:
    // Entry point of the function
    
    // Subtract int1 from int2 and store result in x0
    sub         w0, w0, w1
    
    // Store x0 (which holds the result of subtraction) into the memory location pointed by outInt (x2)
    str         w0, [x2]
    
    // Add double1 to double2 and store result in d0
    fadd        d0, d0, d1
    
    // Store d0 (which holds the result of addition) into the memory location pointed by outDouble (x3)
    str         d0, [x3]
    
    // Return to the caller
    ret
