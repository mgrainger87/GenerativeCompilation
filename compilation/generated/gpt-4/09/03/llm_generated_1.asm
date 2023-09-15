//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.globl  _customFunction
.align  2
_customFunction:
// Save the link register to the stack
stp     x30, x29, [sp, #-16]!
mov     x29, sp

// Compute int2 * int2
mul     w4, w1, w1   // w4 = int2 * int2

// Store result to *outInt
str     w4, [x2]

// Compute double1 * double1
fmul    d4, d0, d0   // d4 = double1 * double1

// Store result to *outDouble
str     d4, [x3]

// Restore the link register and return
ldp     x30, x29, [sp], #16
ret
