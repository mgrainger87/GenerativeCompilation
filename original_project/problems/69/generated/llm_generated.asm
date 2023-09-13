    .globl _customFunction
    .align 2
_customFunction:
    // Prologue: Store callee-saved registers
    stp x19, x20, [sp, #-16]!  // Adjusting the stack to save two registers and then store them

    // Initialize loop counter i in x19
    mov x19, #0

1:  // Start of loop
    // Check loop condition: i < 4
    cmp x19, #4
    b.ge 2f  // If i >= 4, branch to the end of the loop

    // *outInt = int1 + int2
    add w20, w0, w1  // Add int1 and int2
    str w20, [x2]    // Store the result in *outInt

    // Increment loop counter
    add x19, x19, #1
    b 1b  // Jump back to the start of the loop

2:  // End of loop

    // Epilogue: Restore callee-saved registers
    ldp x19, x20, [sp], #16  // Load saved registers and adjust the stack back

    ret
