//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _helperFunction
_helperFunction:
fadd d0, d0, d1
ret
.global _customFunction
_customFunction:
// Save link register
stp x30, x29, [sp, #-16]!
mov x29, sp

// Handle integer addition
add w0, w0, w1
str w0, [x2]

// Call helperFunction
bl _helperFunction

// Store the result in outDouble
str d0, [x3]

// Restore link register and return
ldp x30, x29, [sp], #16
ret
