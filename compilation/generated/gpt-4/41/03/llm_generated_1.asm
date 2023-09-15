//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
// No need for a global directive as it's a static function

_helperFunction:
// Add the two integers
add w0, w0, w1 // w0 = x0 (a) + x1 (b)
ret
.global _customFunction
_customFunction:
// Store callee-saved registers and link register
stp x29, x30, [sp, #-16]!
mov x29, sp // Set frame pointer

// Call helperFunction
bl _helperFunction
// Store the result (in w0) to *outInt (pointed by x2)
str w0, [x2]

// Add the two doubles
fadd d0, d0, d1 // d0 = d0 (double1) + d1 (double2)
// Store the result to *outDouble (pointed by x3)
str d0, [x3]

// Restore callee-saved registers and link register
ldp x29, x30, [sp], #16

ret
