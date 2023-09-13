    .global _customFunction
    .align 2
_customFunction:
    // Multiply int1 with 0
    // Since any number multiplied with 0 is 0, we just move 0 to the destination directly
    mov     w4, #0
    str     w4, [x2]

    // Multiply double1 with 0.0
    // Similarly, any floating point number multiplied with 0 is 0, so we move the zero floating point value to destination
    fmov    d4, #0.0
    str     d4, [x3]

    ret
