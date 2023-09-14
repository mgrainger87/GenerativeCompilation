//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.section    __TEXT,__text,regular,pure_instructions
.globl    _customFunction
.align    2
_customFunction:
// Prologue
stp     x29, x30, [sp, -16]!    // Save frame pointer and link register to stack
mov     x29, sp                 // Set up frame pointer for this function

// Body of the function
// int multiplication: *outInt = int1 * int2;
mul     w4, w0, w1              // Multiply int1 (x0) and int2 (x1), result is 32 bits stored in w4
str     w4, [x2]                // Store the result to the address in outInt (x2)

// double multiplication: *outDouble = double1 * double2;
fmul    d4, d0, d1              // Multiply double1 (d0) and double2 (d1), result stored in d4
str     d4, [x3]                // Store the result to the address in outDouble (x3)

// Epilogue
ldp     x29, x30, [sp], 16      // Restore frame pointer and link register from stack
ret                             // Return to caller
