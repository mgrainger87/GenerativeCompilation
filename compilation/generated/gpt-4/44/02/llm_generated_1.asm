//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _helperFunction
_helperFunction:
// Input: w0 = a
// Output: w0 = a * a
mul w0, w0, w0
ret
.global _customFunction
_customFunction:
// Save the link register (x30) and other callee-saved registers
stp x29, x30, [sp, #-16]!
mov x29, sp

// Call helperFunction(int1)
bl _helperFunction

// Store the result at *outInt
str w0, [x2]

// Calculate double1 - double2
fsub d0, d0, d1

// Store the result at *outDouble
str d0, [x3]

// Restore the link register and other callee-saved registers
ldp x29, x30, [sp], #16
ret
