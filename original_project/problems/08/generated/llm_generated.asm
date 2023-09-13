    .section    __TEXT,__text,regular,pure_instructions
    .globl    _customFunction
    .align    2
_customFunction:
    // Preserve lr for return, and other caller-saved registers if needed.
    // Since we're not calling another function in this case, and we're not modifying any caller-saved registers, no need to preserve them.

    // Compute (int1 * 2) / 2
    lsl    x4, x0, #1        // Multiply int1 by 2 using logical shift left, result in x4
    lsr    x4, x4, #1        // Divide by 2 using logical shift right
    // Store result at address pointed by outInt
    str    w4, [x2]

    // Compute double1 * double2
    fmul    d2, d0, d1       // Multiply double1 and double2, result in d2
    // Store result at address pointed by outDouble
    str    d2, [x3]

    // Return
    ret
