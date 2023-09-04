.globl _customFunction
.align 2
_customFunction:
    // Prologue: set up stack frame
    stp x29, x30, [sp, #-16]! // Save frame pointer and link register to stack
    mov x29, sp               // Set up frame pointer for this function frame

    // Initialize loop counter
    mov w4, #0                // w4 will be used as our loop counter (i)

1:  // Check loop condition
    cmp w4, #2
    b.ge 2f                   // If i >= 2, exit the loop

    // Loop body
    str w1, [x2]             // *outInt = int2

    // Increment loop counter and jump back to start of loop
    add w4, w4, #1
    b 1b

2:  // End of function
    // Epilogue: restore stack frame
    ldp x29, x30, [sp], #16
    ret
