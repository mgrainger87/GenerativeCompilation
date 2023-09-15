//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _helperFunction
_helperFunction:
// Multiply a * a and return the result
mul w0, w0, w0
ret
.global _customFunction
_customFunction:
// Save link register (return address) to stack
stp x30, xzr, [sp, #-16]!

// Call helperFunction with int1 as argument
bl _helperFunction

// Store the result in *outInt
str w0, [x2]

// Compute double1 - double2
fsub d0, d0, d1

// Store the result in *outDouble
str d0, [x3]

// Restore link register and return
ldp x30, xzr, [sp], #16
ret
