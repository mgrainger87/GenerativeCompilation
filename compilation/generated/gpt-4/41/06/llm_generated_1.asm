//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _helperFunction
_helperFunction:
add w0, w0, w1
ret

.global _customFunction
_customFunction:
// Save link register to the stack
stp x30, x19, [sp, #-16]!

// Call helperFunction
bl _helperFunction

// Store the result to outInt
str w0, [x2]

// Add double1 and double2
fadd d0, d0, d1

// Store the result to outDouble
str d0, [x3]

// Restore link register from the stack and return
ldp x30, x19, [sp], #16
ret
