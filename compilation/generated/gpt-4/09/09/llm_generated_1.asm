//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction

_customFunction:
// Save callee-saved registers and link register
stp x29, x30, [sp, #-16]!   // Save frame pointer and link register
mov x29, sp                // Set frame pointer to current stack pointer

// Compute int2 * int2
mul w4, w1, w1             // w4 = int2 * int2

// Store the result to *outInt
str w4, [x2]

// Compute double1 * double1
fmul d4, d0, d0            // d4 = double1 * double1

// Store the result to *outDouble
str d4, [x3]

// Restore the frame pointer and link register
ldp x29, x30, [sp], #16

ret
