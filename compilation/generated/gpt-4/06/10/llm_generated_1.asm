//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.globl _customFunction
.align 3
_customFunction:
// Function Prologue
stp x29, x30, [sp, #-16]!  // Store FP (x29) and LR (x30) to stack
mov x29, sp               // Set FP to current SP

// int1 + int2 * 2
lsl w4, w1, #1            // w4 = int2 * 2
add w4, w4, w0            // w4 = w4 + int1
str w4, [x2]              // *outInt = w4

// Load immediate values for multiplication
fmov d4, #2.0
fmul d4, d0, d4           // d4 = double1 * 2
fadd d4, d4, d1           // d4 = d4 + double2
str d4, [x3]              // *outDouble = d4

// Function Epilogue
ldp x29, x30, [sp], #16   // Restore FP and LR from stack
ret                       // Return
