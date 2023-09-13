.global _customFunction
.align 2

_customFunction:
    // Save frame pointer and link register
    stp x29, x30, [sp, #-16]!
    mov x29, sp

    // Compute (int1 + 2) into x4
    add x4, x0, #2

    // Compute (int2 + 3) into x5
    add x5, x1, #3

    // Multiply x4 and x5 and store the result into *outInt (x2)
    mul x4, x4, x5
    str x4, [x2]

    // Load 1.0 into a temporary float register (d2)
    // ARM64 doesn't allow immediate float value in fadd, so we'll use a common trick
    // which is to load an integer representation of the float into a general-purpose register
    // and then move that to a floating-point register.
    mov x4, #0x3FF0000000000000  // This is the integer representation of 1.0
    fmov d2, x4

    // Load 2.0 into another temporary float register (d3)
    mov x4, #0x4000000000000000  // This is the integer representation of 2.0
    fmov d3, x4

    // Compute (double1 + 1.0) into d4
    fadd d4, d0, d2

    // Compute (double2 + 2.0) into d5
    fadd d5, d1, d3

    // Multiply d4 and d5 and store the result into *outDouble (x3)
    fmul d4, d4, d5
    str d4, [x3]

    // Restore frame pointer and link register, and return
    ldp x29, x30, [sp], #16
    ret
