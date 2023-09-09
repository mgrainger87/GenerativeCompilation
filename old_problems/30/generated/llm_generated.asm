    .globl _customFunction
    .align 2
_customFunction:
    // Compare int1 and int2
    cmp x0, x1

    // Add int1 and int2
    add x4, x0, x1

    // Store the result at the address in x2
    str x4, [x2]

    // Add double1 and double2
    fadd d2, d0, d1

    // Store the result at the address in x3
    str d2, [x3]

    // Return
    ret
