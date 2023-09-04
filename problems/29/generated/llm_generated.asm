    .globl  _customFunction
    .align  2
_customFunction:
    // No need to save any callee-saved registers as they aren't modified in this function.
    // The condition (int1 && !int1) will never be true, so we skip the associated code.

    // *outDouble = double1 + double2;
    fadd    d0, d0, d1          // d0 = d0 + d1 (double1 + double2)
    str     d0, [x3]           // Store the result in *outDouble

    ret
