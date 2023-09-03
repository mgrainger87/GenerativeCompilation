    .section	__TEXT,__text,regular,pure_instructions
    .build_version macos, 13, 0	sdk_version 13, 3
    .globl	_customFunction
    .p2align	2
_customFunction:
    .cfi_startproc

    // Store the outer loop counter 'i' in x4, initialized to 0
    mov x4, #0 

1:  // Outer loop start
    cmp x4, x0  // Compare i with int1
    b.ge 3f     // If i >= int1, exit outer loop

    // Store the inner loop counter 'j' in x5, initialized to 0
    mov x5, #0

2:  // Inner loop start
    cmp x5, x1  // Compare j with int2
    b.ge 4f     // If j >= int2, exit inner loop

    // Check if j is even using bitwise operation
    and x6, x5, #1  // x6 = j & 1
    cbz x6, 5f      // If x6 == 0 (j is even), branch

    // Else block for j is odd
    add x7, x0, x1  // x7 = int1 + int2
    str x7, [x2]    // Store result to *outInt
    b 6f            // Jump to end of inner loop

5:  // Block for j is even
    add x7, x4, x5  // x7 = i + j
    // Note: tmp1 is not used in the original C code, so we don't need to store it anywhere.

6:  // End of inner loop
    add x5, x5, #1  // Increment j
    b 2b            // Jump back to start of inner loop

4:  // End of outer loop
    add x4, x4, #1  // Increment i
    b 1b            // Jump back to start of outer loop

3:  // After both loops
    fadd d2, d0, d1  // d2 = double1 + double2
    str d2, [x3]     // Store result to *outDouble

    ret              // Return
    .cfi_endproc
