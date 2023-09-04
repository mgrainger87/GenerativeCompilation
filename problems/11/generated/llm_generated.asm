.global _customFunction
.align 2
_customFunction:
    // Prologue
    stp x29, x30, [sp, #-16]!  // Save frame pointer and link register
    mov x29, sp               // Set frame pointer

    // *outInt = (int1 + 10 - 5) * (int2 + 5 - 2)
    // Calculate int1 + 10 - 5
    add x4, x0, #10           // x4 = int1 + 10
    sub x4, x4, #5            // x4 = int1 + 5

    // Calculate int2 + 5 - 2
    add x5, x1, #5            // x5 = int2 + 5
    sub x5, x5, #2            // x5 = int2 + 3

    // Multiply results
    mul x4, x4, x5            // x4 = (int1 + 5) * (int2 + 3)

    // Store the result in *outInt
    str x4, [x2]

    // Epilogue
    ldp x29, x30, [sp], #16   // Restore frame pointer and link register
    ret
