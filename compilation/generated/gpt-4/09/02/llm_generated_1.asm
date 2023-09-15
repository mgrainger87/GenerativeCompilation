//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Store link register to preserve return address
str     lr, [sp, #-16]!   // Pre-decrement stack pointer by 16 bytes and store lr

// *outInt = int2 * int2
mul     w4, w1, w1        // w4 = int2 * int2
str     w4, [x2]          // Store result to *outInt

// *outDouble = double1 * double1
fmul    d4, d0, d0        // d4 = double1 * double1
str     d4, [x3]          // Store result to *outDouble

// Restore link register and return
ldr     lr, [sp], #16     // Post-increment stack pointer by 16 bytes and load lr
ret
