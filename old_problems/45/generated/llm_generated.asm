.global _customFunction
.align 2
_customFunction:
    // Multiply int1 by 5
    lsl x4, x0, 2        // x4 = x0 * 4
    add x4, x4, x0       // x4 = x4 + x0

    // Store result in *outInt
    str w4, [x2]

    // Multiply double1 by 6
    fmov d4, d0          // d4 = d0
    fadd d4, d4, d0      // d4 = d4 + d0
    fadd d4, d4, d0      // d4 = d4 + d0
    fadd d4, d4, d0      // d4 = d4 + d0
    fadd d4, d4, d0      // d4 = d4 + d0
    fadd d4, d4, d0      // d4 = d4 + d0

    // Store result in *outDouble
    str d4, [x3]

    // Return
    ret
