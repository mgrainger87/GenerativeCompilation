//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _helperFunction
_helperFunction:
// Multiply a and b
fmul d0, d0, d1
ret
.global _customFunction
_customFunction:
// Save the link register since we'll be making a function call
stp x30, x29, [sp, #-16]!
mov x29, sp

// Call helperFunction with double1 and double2
bl _helperFunction
// Store the result (*outDouble = d0)
str d0, [x3]

// Compute int1 - int2 and store the result in x0
sub w0, w0, w1
// Store the result (*outInt = x0)
str w0, [x2]

// Restore the link register
ldp x30, x29, [sp], #16
ret
