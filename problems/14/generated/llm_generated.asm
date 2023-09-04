    .section    __TEXT,__text,regular,pure_instructions
    .globl    _customFunction
    .align    2
_customFunction:
    // Function prologue
    stp    x29, x30, [sp, -16]!     // Save frame pointer and return address
    mov    x29, sp                  // Update frame pointer

    // int temp1 = int1 + 7;
    add    w4, w0, #7               // w4 will hold temp1

    // double temp2 = double2 - 0.5;
    fmov    d2, #0.5                // Load 0.5 into d2
    fsub    d2, d1, d2              // Subtract 0.5 from double2 and store in d2

    // *outDouble = temp1 + temp2;
    scvtf   d3, w4                  // Convert temp1 (integer) to double precision in d3
    fadd    d3, d3, d2              // Add d3 and d2
    str     d3, [x3]                // Store the result in *outDouble

    // Function epilogue
    ldp    x29, x30, [sp], 16       // Restore frame pointer and return address
    ret
