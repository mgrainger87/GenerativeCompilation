.global _customFunction
_customFunction:
    // Stack setup
    stp x29, x30, [sp, #-16]!  // Save frame pointer and return address
    mov x29, sp                // Set up the frame pointer

    // Local variables:
    // int i = 0
    mov w4, #0                 // Use w4 for loop counter 'i'

1:  // Start of loop
    cmp w4, w0                 // Compare i with int1
    bge 2f                     // If i >= int1, break loop

    // Inside loop
    mul w5, w0, w1             // tmp = int1 * int2, store result in w5
    add w4, w4, #1             // Increment i
    b 1b                       // Loop back

2:  // End of loop
    // *outInt = int2
    str w1, [x2]

    // *outDouble = double1 + double2
    fadd d4, d0, d1            // Add double1 and double2, result in d4
    str d4, [x3]               // Store result to outDouble

    // Stack teardown and return
    ldp x29, x30, [sp], #16    // Restore frame pointer and return address
    ret                        // Return from function
