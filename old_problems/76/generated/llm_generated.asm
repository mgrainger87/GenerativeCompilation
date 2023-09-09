.global _customFunction
_customFunction:
    // Save caller-saved registers and frame pointer
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    
    // Initialize loop counter i to 0
    mov w4, #0  // Use w4 as it is a temporary register for our loop counter

1:  // Loop label
    // Compare i to 2
    cmp w4, #2
    b.ge 2f  // If i >= 2, exit loop

    // *outDouble = double1 + double2
    fadd d5, d0, d1
    str d5, [x3]
    
    // Increment loop counter i
    add w4, w4, #1
    b 1b

2:  // End of loop label
    // Restore saved registers and return
    ldp x29, x30, [sp], #16
    ret
