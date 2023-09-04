.global _customFunction
.align 2
_customFunction:
    // Save callee-saved registers and link register (lr) if necessary. 
    // No need to save for this function since we are not making any function calls
    // and are not using any callee-saved registers.

    // *outInt = int1;
    str w0, [x2]

    // *outInt = int2;
    str w1, [x2]

    // *outDouble = double1 + double2;
    fadd d4, d0, d1      // Add double1 and double2 and store in d4
    str  d4, [x3]        // Store the result in *outDouble

    // Restore callee-saved registers and link register (lr) if necessary.
    // Again, no need in this case.

    ret
