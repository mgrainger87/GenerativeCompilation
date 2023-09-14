//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _helperFunction
_helperFunction:
// Multiply d0 by d1 and store the result in d0
fmul d0, d0, d1
ret
.global _customFunction
_customFunction:
// Save link register to the stack
stp x30, xzr, [sp, #-16]!

// Call helperFunction
bl _helperFunction

// Load the result from d0 to memory location pointed by x3 (outDouble)
str d0, [x3]

// Subtract x1 from x0 and store the result in x0
sub w0, w0, w1

// Store the result from x0 to memory location pointed by x2 (outInt)
str w0, [x2]

// Restore link register from the stack
ldp x30, xzr, [sp], #16
ret
