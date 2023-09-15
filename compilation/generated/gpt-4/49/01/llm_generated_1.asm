//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _helperFunction
_helperFunction:
// Parameters are passed in d0 (a) and d1 (b)
fadd d0, d0, d1 // d0 = a + b
ret
.global _customFunction
_customFunction:
// Save the link register (x30) onto the stack since we'll be calling another function
stp x30, xzr, [sp, #-16]! // Adjust stack by 16 bytes and save x30 and zero register

// Calculate int1 + int2
add w4, w0, w1
str w4, [x2] // Store the result to *outInt

// Call helperFunction to calculate double1 + double2
bl _helperFunction
str d0, [x3] // Store the result to *outDouble

// Restore the link register (x30) from the stack
ldp x30, xzr, [sp], #16 // Pop x30 and zero register from the stack

ret
