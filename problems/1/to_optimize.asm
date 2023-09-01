    .globl _customFunction                 // Function visibility is global
    .align 3                               // Align to 8 bytes for AArch64
_customFunction:
    // *outInt = int1 * 2 + int2 * 3 + 10;
    mov x7, #2                             // Load constant 2 into x7
    mul x7, x0, x7                         // int1 * 2, result in x7
    mov x8, #3                             // Load constant 3 into x8
    mul x8, x1, x8                         // int2 * 3, result in x8
    add x7, x7, x8                         // int1*2 + int2*3, result in x7
    add x7, x7, #10                        // Add 10 to x7
    str x7, [x4]                           // Store the result to *outInt

    // *outDouble = double1 + double2 + 5.5;
    fadd d2, d0, d1                        // double1 + double2, result in d2
    fmov d3, #5.5                          // Move 5.5 into d3
    fadd d2, d2, d3                        // Add 5.5 (from d3) to d2
    str d2, [x5]                           // Store the result to *outDouble

    ret                                    // Return from function
