    .section    __TEXT,__text,regular,pure_instructions
    .globl    _customFunction
    .align    2
_customFunction:
    // Save callee-saved registers (including lr)
    stp    x29, x30, [sp, #-16]!  // Save frame pointer and link register
    mov    x29, sp                // Set frame pointer

    // Initialize counter for the first loop
    mov    x4, #0

1:  // Local label for the loop
    // Check if i < int1
    cmp    x4, x0
    b.ge    2f  // Exit loop if condition is not met

    // Perform *outInt = int1 * int2;
    mul    x5, x0, x1
    str    x5, [x2]

    // Increment counter i
    add    x4, x4, #1
    b    1b  // Jump to the start of the loop

2:  // Local label for loop exit
    // Perform *outInt = int1 + int2;
    add    x5, x0, x1
    str    x5, [x2]

    // Initialize counter for the second loop
    mov    x4, #0

3:  // Local label for the second loop
    // Check if j < int2
    cmp    x4, x1
    b.ge    4f  // Exit loop if condition is not met

    // Perform tmp = double1 * 2; (result is not used)
    fmov    d2, #2.0
    fmul    d3, d0, d2

    // Increment counter j
    add    x4, x4, #1
    b    3b  // Jump to the start of the second loop

4:  // Local label for second loop exit
    // Perform *outDouble = double1 + double2;
    fadd    d2, d0, d1
    str    d2, [x3]

    // Restore callee-saved registers and return
    ldp    x29, x30, [sp], #16
    ret
