.global _customFunction
.align 2
_customFunction:
    // Save callee-saved registers if needed (not necessary in this case)

    // Load floating point constants into registers
    fmov d4, #1.0
    fmov d5, #0.5
    fmov d6, #1.5
    fmov d7, #2.5

    // Compute (double1 + 2.5 - 1.5)
    fadd d8, d0, d7   // Add d7 (2.5) to d0 (double1)
    fsub d8, d8, d6   // Subtract d6 (1.5) from d8

    // Compute (double2 + 1.0 - 0.5)
    fadd d9, d1, d4   // Add d4 (1.0) to d1 (double2)
    fsub d9, d9, d5   // Subtract d5 (0.5) from d9

    // Divide the two results
    fdiv d8, d8, d9   // d8 = d8 / d9 => (double1 + 2.5 - 1.5) / (double2 + 1.0 - 0.5)

    // Store the result to *outDouble
    str d8, [x3]

    // Return
    ret
