//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save callee-saved registers and the link register
stp x29, x30, [sp, #-16]!   // Save frame pointer and link register
mov x29, sp                 // Set up frame pointer

// Calculate int1 * 3 - int2
lsl w4, w0, #1              // w4 = int1 * 2
add w4, w4, w0              // w4 = w4 + int1 (int1 * 3)
sub w4, w4, w1              // w4 = w4 - int2
str w4, [x2]                // Store result to *outInt

// Calculate double1 - double2 * 3
fmov d2, #3.0               // Load 3.0 into d2
fmul d2, d2, d1             // d2 = double2 * 3
fsub d2, d0, d2             // d2 = double1 - d2
str d2, [x3]                // Store result to *outDouble

// Restore callee-saved registers and return
ldp x29, x30, [sp], #16
ret
