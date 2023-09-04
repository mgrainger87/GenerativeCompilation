.global _customFunction
.align 2

_customFunction:
    // Check if int1 is less than 6
    cmp w0, #6
    b.lt 1f

    // If int1 is not less than 6
    str w0, [x2]
    ret

1:
    // If int1 is less than 6
    add w4, w0, w1  // Calculate int1 + int2
    str w4, [x2]    // Store the result to *outInt
    fsub d2, d0, d1 // Calculate double1 - double2
    str d2, [x3]    // Store the result to *outDouble
    ret
