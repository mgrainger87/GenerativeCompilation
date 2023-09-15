//compiler_errors=0,linker_errors=0,execution_errors=1,correctness_errors=0
.global _customFunction

// Helper function (not global since it's static in C)
_helperFunction:
fmul d0, d0, d0
ret

_customFunction:
// Push link register and frame pointer onto the stack
stp x30, x29, [sp, #-16]!
// Store int1 (x0) at the address in outInt (x2)
str w0, [x2]
// Call helperFunction
bl _helperFunction
// Store the return value (d0) at the address in outDouble (x3)
str d0, [x3]
// Pop link register and frame pointer from the stack
ldp x30, x29, [sp], #16
ret
