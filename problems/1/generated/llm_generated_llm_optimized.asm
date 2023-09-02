.global _customFunction
.align 3
_customFunction:
    // Preserve the link and frame registers
    stp     fp, lr, [sp, #-16]!

    // Compute *outInt = int1 * 2 + int2 * 3 + 10
    add     w8, w0, w0       // w8 = int1 * 2
    add     w9, w1, w1       // w9 = int2 * 2
    add     w9, w9, w1       // w9 = int2 * 3
    add     w8, w8, w9       // w8 = int1 * 2 + int2 * 3
    add     w8, w8, #10      // w8 = int1 * 2 + int2 * 3 + 10
    str     w8, [x4]         // Store w8 to *outInt

    // Compute *outDouble = double1 + double2 + 5.5
    fadd    d8, d0, d1       // d8 = double1 + double2
    fmov    d9, #5.5         // d9 = 5.5
    fadd    d8, d8, d9       // d8 = double1 + double2 + 5.5
    str     d8, [x5]         // Store d8 to *outDouble

    // Restore the link and frame registers and return
    ldp     fp, lr, [sp], #16
    ret
