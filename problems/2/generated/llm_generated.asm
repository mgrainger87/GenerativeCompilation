    .text
    .globl  _customFunction
    .align  3
_customFunction:
    // Directly set the length of the string "constant" (which is 8) into *outInt
    mov     w0, #8                // load immediate value 8 into w0
    str     w0, [x4]              // store w0 into *outInt

    // *outDouble = double1 * 0 + double2 * 0;
    // Since both multipliers are 0, the result is always 0
    fmov    d0, #0.0              // move floating point 0 into d0
    str     d0, [x5]              // store 0.0 into *outDouble

    ret
