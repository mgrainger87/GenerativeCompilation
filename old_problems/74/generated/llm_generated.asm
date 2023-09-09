    .global _customFunction
    .align 2
_customFunction:
    // Store the link register and other registers that we will use
    stp x29, x30, [sp, #-16]!  // Store frame pointer (x29) and link register (x30) onto the stack
    mov x29, sp               // Update frame pointer
    
    // Initialize the loop counter
    mov w4, #0                // w4 is our loop counter i. We use 32-bit register w4 for integer i
    
1:  // This is our local label for the loop
    // Loop body
    str d1, [x3]              // Store the value of double2 (d1) into *outDouble
    
    // Increment the loop counter
    add w4, w4, #1            // Increment i
    
    // Check loop condition
    cmp w4, #2                // Compare i with 2
    b.lt 1b                   // If i < 2, branch to the loop label
    
    // Restore saved registers and return
    ldp x29, x30, [sp], #16   // Restore frame pointer and link register
    ret                       // Return from the function
