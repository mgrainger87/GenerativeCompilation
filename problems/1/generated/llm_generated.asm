    .global _customFunction
    .align 2

_customFunction:
    // Store lr to preserve return address
    stp x30, x29, [sp, #-16]!

    // *outInt = int1 * 2 + int2 * 3 + 10;
    lsl x7, x0, #1      // int1 * 2
    lsl x8, x1, #1      // int2 * 2
    add x8, x8, x1      // int2 * 3
    add x7, x7, x8      // int1 * 2 + int2 * 3
    add x7, x7, #10     // int1 * 2 + int2 * 3 + 10
    str x7, [x4]        // store result to outInt

    // *outDouble = double1 + double2 + 5.5;
    fmov d2, #5.5
    fadd d0, d0, d1
    fadd d0, d0, d2
    str d0, [x5]        // store result to outDouble

    // Restore lr and return
    ldr x30, [sp], #16
    ret
