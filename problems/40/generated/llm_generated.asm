.global _customFunction
.align 2

_customFunction:
    // Entry
    stp x29, x30, [sp, #-16]!  // Save frame pointer and return address
    mov x29, sp                // Set up frame pointer

    // int temp = int1; (Not needed as value of temp is immediately overwritten)
    // temp = int2; (Not needed as value of temp is immediately overwritten)
    // temp = int1 + int2;
    add w4, w0, w1

    // *outInt = temp;
    str w4, [x2]

    // *outDouble = double1 + double2;
    fadd d4, d0, d1
    str d4, [x3]

    // Exit
    ldp x29, x30, [sp], #16   // Restore frame pointer and return address
    ret
