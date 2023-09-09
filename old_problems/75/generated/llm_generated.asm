.global _customFunction
.align 2

_customFunction:
    // Entry of the function
    // Saving callee-saved registers (if required) 
    // For this function, we won't use any callee-saved registers, so no need to save them.
    
    // Initialize the loop counter `i` to 0
    mov w4, #0  // Using w4 for loop counter `i`

1:  // Local label for the loop start
    // Loop condition: compare i (w4) with 2
    cmp w4, #2
    b.ge 2f     // If i >= 2, exit loop

    // Inside loop body
    // *outInt = int1 + int2;
    add w5, w0, w1      // Adding int1 and int2 and storing result in w5
    str w5, [x2]       // Storing result in *outInt

    // Increment loop counter `i`
    add w4, w4, #1
    // Go back to the start of the loop
    b 1b

2:  // Local label for loop exit
    // Return
    ret
