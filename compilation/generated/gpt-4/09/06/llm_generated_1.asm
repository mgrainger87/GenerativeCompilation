//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction

_customFunction:
// Store link register to preserve return address
stp x29, x30, [sp, #-16]!

// Set up frame pointer
mov x29, sp

// Multiply int2 by int2
mul w4, w1, w1

// Store the result to *outInt
str w4, [x2]

// Multiply double1 by double1
fmul d4, d0, d0

// Store the result to *outDouble
str d4, [x3]

// Restore stack and frame pointer
ldp x29, x30, [sp], #16

ret
