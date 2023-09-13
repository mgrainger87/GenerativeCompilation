.global _customFunction
.align 2

_customFunction:
    // Prologue: Create stack frame
    stp x29, x30, [sp, -16]! // Save frame pointer and return address
    mov x29, sp             // Set the new frame pointer

    // Initialize the loop counter
    mov w4, #0              // Use w4 as our loop counter, i = 0

1:  // Start of the loop
    cmp w4, #2              // Compare i with 2
    b.ge 2f                 // If i >= 2, exit the loop

    // Loop body
    str d0, [x3]            // *outDouble = double1

    // Increment the loop counter and loop
    add w4, w4, #1          // i++
    b 1b                    // Go to the start of the loop

2:  // End of the loop

    // Epilogue: Restore stack frame and return
    ldp x29, x30, [sp], 16  // Restore frame pointer and return address
    ret
