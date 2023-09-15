//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Prologue: Save necessary callee-saved registers
stp x29, x30, [sp, -16]!  // Save frame pointer and link register
mov x29, sp               // Set the frame pointer to the current stack pointer

// Multiply int2 with itself and store the result
mul w4, w1, w1            // w4 = int2 * int2
str w4, [x2]              // Store the result to *outInt

// Multiply double1 with itself and store the result
fmul d2, d0, d0           // d2 = double1 * double1
str d2, [x3]              // Store the result to *outDouble

// Epilogue: Restore saved registers and return
ldp x29, x30, [sp], 16    // Restore frame pointer and link register
ret                       // Return
