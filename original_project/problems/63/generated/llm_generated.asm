    .globl  _helper
    .align  3
_helper:
    // Multiply double value by 2
    fmov    d2, #2.0                // Load 2.0 into d2 register
    fmul    d0, d0, d2              // Multiply d0 by 2 and store in d0
    ret

    .globl  _customFunction
    .align  3
_customFunction:
    // Setup the stack for local variables and save callee-saved registers
    stp     x29, x30, [sp, #-32]!   // Save frame pointer and return address
    mov     x29, sp                 // Set up frame pointer
    sub     sp, sp, #16             // Allocate space for local variable `result`

    // Initialize result to 0
    fmov    d3, #0.0                // Load 0.0 into d3 (local double variable for `result`)

    // Initialize loop counter
    mov     w4, #3                  // Load 3 into w4 for loop control

    // Start of loop
1:  subs    w4, w4, #1              // Subtract 1 from w4 for each iteration
    blt     2f                      // If w4 < 0, break out of the loop

    // Call helper function
    stp     x29, x30, [sp, #-16]!   // Save frame pointer and return address before the call
    fmov    d0, d1                  // Copy double2 to d0 for helper function
    bl      _helper                 // Call helper function
    ldp     x29, x30, [sp], #16     // Restore frame pointer and return address after the call
    fadd    d3, d3, d0              // Add returned value to result

    b       1b                      // Repeat loop

    // End of loop
2:  str     w0, [x2]                // Store int1 to *outInt
    str     d3, [x3]                // Store result to *outDouble

    // Restore stack and callee-saved registers
    add     sp, sp, #16             // Deallocate local variables space
    ldp     x29, x30, [sp], #32     // Restore frame pointer and return address
    ret
