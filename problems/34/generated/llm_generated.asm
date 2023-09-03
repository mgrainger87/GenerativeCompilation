    .globl _customFunction
    .align 3
_customFunction:
    // Save callee-saved registers if necessary
    // In this case, we don't need to, as we won't use any of them

    // Initialize i (stored in x4) to 0
    mov x4, #0 

1:  // Outer loop start
    cmp x4, x0  // Compare i with int1
    b.ge 3f     // If i >= int1, exit outer loop

    // Initialize j (stored in x5) to 0
    mov x5, #0

2:  // Inner loop start
    cmp x5, x1  // Compare j with int2
    b.ge 4f     // If j >= int2, exit inner loop

    // Check if j % 2 == 0
    and x6, x5, #1  // x6 = j & 1
    cbz x6, 5f      // If x6 == 0, go to the block for j % 2 == 0

    // Else block for j % 2 != 0
    add x7, x0, x1       // x7 = int1 + int2
    str x7, [x2]         // *outInt = x7
    b 6f                 // Jump to end of inner loop

5:  // Block for j % 2 == 0
    add x7, x4, x5       // x7 = i + j

6:  // End of inner loop
    add x5, x5, #1       // Increment j
    b 2b                 // Jump back to start of inner loop

4:  // End of outer loop
    add x4, x4, #1       // Increment i
    b 1b                 // Jump back to start of outer loop

3:  // After both loops
    fadd d2, d0, d1      // d2 = double1 + double2
    str d2, [x3]         // *outDouble = d2

    ret                  // Return
