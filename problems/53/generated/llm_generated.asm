.global _customFunction

.align 2
_customFunction:
    // Prologue
    stp x29, x30, [sp, #-16]!    // Save frame pointer and link register
    mov x29, sp                 // Update the frame pointer to the current stack pointer

    // Compute (int1 * 7) + int1
    // Using shifts and additions for multiplication to reduce instruction count
    lsl x4, x0, #1              // x4 = int1 * 2
    lsl x5, x0, #2              // x5 = int1 * 4
    add x4, x4, x5              // x4 = int1 * 6
    add x4, x4, x0              // x4 = int1 * 7
    add x4, x4, x0              // x4 = (int1 * 7) + int1
    str w4, [x2]                // *outInt = x4

    // Compute (double1 * 15) + double1 using floating-point instructions
    fmov d2, #15.0              // Load 15.0 into d2
    fmul d2, d2, d0             // d2 = double1 * 15.0
    fadd d2, d2, d0             // d2 = (double1 * 15.0) + double1
    str d2, [x3]                // *outDouble = d2

    // Epilogue
    ldp x29, x30, [sp], #16    // Restore frame pointer and link register
    ret                        // Return
