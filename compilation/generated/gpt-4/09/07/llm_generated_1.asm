//compiler_errors=3,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align  2

_customFunction:
// Save frame pointer and link register to preserve return address
stp     x29, lr, [sp, #-16]!

// Update the frame pointer
mov     x29, sp

// Multiply int2 with itself
mul     w4, w1, w1

// Store the result in *outInt
str     w4, [x2]

// Multiply double1 with itself using floating-point multiplication
fmul    d4, d0, d0

// Store the result in *outDouble
str     d4, [x3]

// Restore the frame pointer and link register
ldp     x29, lr, [sp], #16

// Return from function
ret
