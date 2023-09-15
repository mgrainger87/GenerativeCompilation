//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.global _helperFunction
_helperFunction:
// Add W0 and W1 and store result in W0
add w0, w0, w1
ret
.global _customFunction
_customFunction:
// Store the return address (link register) and FP
stp x30, x29, [sp, #-16]!
mov x29, sp

// Call helperFunction to compute int1 + int2
bl _helperFunction

// Store the result at address in X2
str w0, [x2]

// Add D0 and D1 and store result in D0
fadd d0, d0, d1

// Store the result at address in X3
str d0, [x3]

// Restore the stack and return
ldp x30, x29, [sp], #16
ret
