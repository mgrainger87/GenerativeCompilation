//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _helperFunction
_helperFunction:
// return a * b
fmul d0, d0, d1
ret
.global _customFunction
_customFunction:
// Save the link register
stp x30, xzr, [sp, #-16]!

// Call helperFunction(double1, double2)
bl _helperFunction

// Store the result of helperFunction in *outDouble
str d0, [x3]

// Calculate int1 - int2 and store in *outInt
sub w4, w0, w1
str w4, [x2]

// Restore the link register and return
ldp x30, xzr, [sp], #16
ret
