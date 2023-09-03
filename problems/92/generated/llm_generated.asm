    .section    __TEXT,__text,regular,pure_instructions
    .globl    _customFunction
    .align    2
_customFunction:
    // Prologue
    stp x29, x30, [sp, #-16]!   // Save frame pointer and link register to stack
    mov x29, sp                 // Set the new frame pointer

    // int a = int2 - 3;
    sub x4, x1, #3

    // int b = a;
    mov x5, x4

    // *outInt = b;
    str x5, [x2]

    // Compute the relative address of the float_constants label
    adr x6, float_constants

    // Load the constant 1.2 into d2
    ldr d2, [x6]

    // double x = double2 * 1.2;
    fmul d3, d1, d2

    // double y = x;
    fmov d4, d3

    // *outDouble = y;
    str d4, [x3]

    // Epilogue
    ldp x29, x30, [sp], #16    // Restore frame pointer and link register
    ret                        // Return

    // Floating-point constant
float_constants:
    .double    1.2
