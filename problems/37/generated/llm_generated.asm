.global _customFunction
.align 2

_customFunction:
    // Save frame pointer and link register
    stp x29, x30, [sp, #-16]!
    mov x29, sp

    // Store int2 to *outInt
    str w1, [x2]

    // Calculate double1 + double2 and store in *outDouble
    fadd d0, d0, d1
    str d0, [x3]

    // Restore frame pointer and link register and return
    ldp x29, x30, [sp], #16
    ret
