    .globl  _customFunction
    .align  2
_customFunction:
    // Save the link register
    stp     x30, x29, [sp, #-16]!
    mov     x29, sp

    mov     x5, #2         // Initialize loop counter x5 to 2

1:  // Local label for the loop start

    // *outInt = int1 - int2;
    sub     w4, w0, w1       // w4 = int1 - int2
    str     w4, [x2]         // store the result at the address in x2

    // Decrement and test the loop counter
    subs    x5, x5, #1       // Decrement our loop counter
    b.ne    1b               // Loop if not zero/equal

    // Restore the link register
    ldp     x30, x29, [sp], #16

    ret
