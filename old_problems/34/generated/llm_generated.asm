    .globl _customFunction
    .align  3
_customFunction:
    // *outInt = int1 * 1;
    // Since int1 * 1 is just int1, we can simply store it directly.
    str w0, [x2]            // Store w0 (which has int1) to the address in x2 (outInt)

    // *outDouble = double1 + double2 + 0;
    // We'll use fadd to add double1 and double2.
    fadd d0, d0, d1         // d0 = d0 + d1
    str d0, [x3]            // Store d0 to the address in x3 (outDouble)

    ret                     // Return from the function
