//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Saving callee-saved registers and link register
stp     x29, x30, [sp, #-16]!     // Store FP (x29) and LR (x30)
mov     x29, sp                   // Set FP to SP

// Checking if int1 is even
and     w4, w0, #1                // w4 = int1 & 1
cbz     w4, .isEven               // If w4 is 0, branch to .isEven

.isOdd:
// int1 is odd, so directly store int1 and double1
str     w0, [x2]                  // *outInt = int1
str     d0, [x3]                  // *outDouble = double1
b       .end

.isEven:
// int1 is even, so divide int1 by 2 and multiply double1 by 2
lsr     w4, w0, #1                // w4 = int1 >> 1 (int1 / 2)
fmov    d2, #2.0                  // d2 = 2.0
fmul    d2, d0, d2                // d2 = double1 * 2.0
str     w4, [x2]                  // *outInt = int1 / 2
str     d2, [x3]                  // *outDouble = double1 * 2.0

.end:
// Restore callee-saved registers and return
ldp     x29, x30, [sp], #16       // Restore FP (x29) and LR (x30)
ret                               // Return
