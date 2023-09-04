    .globl  _customFunction
    .align  2
_customFunction:
    // Create stack space for local variables and save the frame pointer
    stp     x29, x30, [sp, -16]!  // Store pair of x29 and x30 to the stack (pre-indexed by 16 bytes)
    mov     x29, sp               // Set the frame pointer to the current stack pointer

    // Compute a = int1 - int2
    sub     w4, w0, w1            // Subtract w1 from w0 and store in w4

    // b = a
    mov     w5, w4                // Move w4 to w5

    // Store b to *outInt
    str     w5, [x2]              // Store w5 to the address in x2

    // Compute x = double2 + double1
    fadd    d4, d1, d0            // Add d1 and d0 and store in d4

    // y = x
    fmov    d5, d4                // Move d4 to d5

    // Store y to *outDouble
    str     d5, [x3]              // Store d5 to the address in x3

    // Restore the frame pointer and return
    ldp     x29, x30, [sp], 16    // Load pair of x29 and x30 from the stack and adjust stack pointer
    ret
