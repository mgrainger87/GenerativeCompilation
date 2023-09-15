//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _helperFunction
_helperFunction:
// Add the two integer parameters
add w0, w0, w1
// Return value is in x0 by convention. Return to caller.
ret
.global _customFunction
_customFunction:
// Store the link register (return address) and other necessary registers
stp x29, x30, [sp, #-16]! // Save frame pointer and link register
mov x29, sp // Update frame pointer

// Call helperFunction to compute int1 + int2
bl _helperFunction
// Result of helperFunction is in x0, store this in *outInt
str w0, [x2]

// Add the two double parameters
fadd d0, d0, d1
// Store the result in *outDouble
str d0, [x3]

// Restore the frame pointer and link register, then return
ldp x29, x30, [sp], #16
ret
