.global _customFunction
.align 2
_customFunction:
    // Prologue: Save necessary registers
    stp x19, x20, [sp, #-16]!   // Save callee-saved registers
    stp x29, x30, [sp, #-16]!   // Save frame pointer and link register
    mov x29, sp                // Set frame pointer

    // Initialize loop counter i in x19 (using x19 as a callee-saved register)
    mov x19, #0

1:  // Loop label
    // *outDouble = double1 * 2.0;
    fmov d20, #2.0             // Load constant 2.0 into d20
    fmul d20, d20, d0          // Multiply d0 (double1) by 2.0
    str d20, [x3]              // Store result to *outDouble

    // Increment loop counter and check loop termination condition
    add x19, x19, #1           // Increment i
    cmp x19, #2                // Compare i with 2
    blt 1b                     // If i < 2, branch to loop label

    // Epilogue: Restore saved registers and return
    ldp x29, x30, [sp], #16    // Restore frame pointer and link register
    ldp x19, x20, [sp], #16    // Restore callee-saved registers
    ret
