.text
.globl _customFunction
_customFunction:
    // Prologue
    stp x29, x30, [sp, #-16]!  // Save frame pointer and return address
    mov x29, sp                // Set up frame pointer

    // int a = int2 * 7;
    mov w4, #7                 // Load constant 7 into w4
    mul w4, w1, w4             // Multiply int2 (x1) with 7, store result in w4

    // int b = a;
    mov w5, w4                 // Move value of w4 to w5

    // *outInt = b;
    str w5, [x2]               // Store w5 to memory pointed by outInt (x2)

    // Load constant 1.6 into d2
    adrp x4, double_const@PAGE
    ldr d2, [x4, double_const@PAGEOFF]
    
    // double x = double2 * 1.6;
    fmul d2, d1, d2            // Multiply double2 (d1) with 1.6, store result in d2

    // double y = x;
    fmov d3, d2                // Move value of d2 to d3

    // *outDouble = y;
    str d3, [x3]               // Store d3 to memory pointed by outDouble (x3)

    // Epilogue
    ldp x29, x30, [sp], #16   // Restore frame pointer and return address
    ret                       // Return

// Data section with the constant
.section __DATA,.data
.align 3
double_const:
.double 1.6
