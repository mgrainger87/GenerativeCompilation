//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save the link register to the stack (since we don't have a function call, this is optional, but a good practice)
stp x29, x30, [sp, #-16]!    // Save frame pointer and link register
mov x29, sp                 // Set the frame pointer to the current stack pointer

// Compute int1 + int2 * 2
lsl w4, w1, 1               // w4 = int2 * 2
add w4, w4, w0              // w4 = int1 + (int2 * 2)
str w4, [x2]                // Store the result to *outInt

// Compute double1 * 2 + double2
fmov d2, #2.0               // Load 2.0 into d2 register
fmul d2, d2, d0             // d2 = double1 * 2
fadd d2, d2, d1             // d2 = (double1 * 2) + double2
str d2, [x3]                // Store the result to *outDouble

// Restore the link register and return (optional in this case, but good practice)
ldp x29, x30, [sp], #16     // Restore frame pointer and link register
ret                         // Return from function
