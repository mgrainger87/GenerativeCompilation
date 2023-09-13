.global _customFunction

_customFunction:
    // Create a stack frame
    stp x29, x30, [sp, #-16]!
    mov x29, sp

    // Perform the calculation: int1 - (5 + 3 - 2) + int2
    sub w4, w0, #6       // 5 + 3 - 2 = 6. Subtract 6 from int1.
    add w4, w4, w1       // Add int2.

    // Store the result at the address pointed to by outInt
    str w4, [x2]

    // Restore the stack frame
    ldp x29, x30, [sp], #16
    ret
