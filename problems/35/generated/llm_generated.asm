    .section    __TEXT,__text,regular,pure_instructions
    .globl    _customFunction
    .align    2
_customFunction:
    // Saving the link register
    stp     x30, xzr, [sp, #-16]!

    // *outInt = int1;
    str     x0, [x2]

    // for (int i = 0; i < int1; i++)
    mov     x4, #0            // x4 is our loop counter (i)
1:  // Loop start
    cmp     x4, x0            // compare i with int1
    bge     2f                // if i >= int1, break out of loop

    // if (i % 2 == 0)
    and     x5, x4, #1        // x5 = i & 1. This will be zero if i is even
    cbz     x5, 3f            // if x5 is 0, jump to the body of the if statement

4:  // End of the if statement, increment the loop counter
    add     x4, x4, #1        // i++
    b       1b                // go to the start of the loop

3:  // Body of the if statement
    // *outInt = int1 + int2;
    add     x6, x0, x1        // x6 = int1 + int2
    str     x6, [x2]          // store the result in outInt
    b       4b                // jump to the end of the if statement

2:  // End of the loop

    // *outInt = int1 - int2;
    sub     x7, x0, x1
    str     x7, [x2]

    // *outDouble = double1 + double2;
    fadd    d2, d0, d1
    str     d2, [x3]

    // Restore the link register and return
    ldp     x30, xzr, [sp], #16
    ret
