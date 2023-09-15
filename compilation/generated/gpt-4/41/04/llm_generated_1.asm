//compiler_errors=0,linker_errors=0,execution_errors=1,correctness_errors=0
.global _helperFunction
_helperFunction:
add w0, w0, w1
ret

.global _customFunction
_customFunction:
// Save link register to the stack
stp x30, xzr, [sp, #-16]!

// Call helperFunction to add int1 and int2
bl _helperFunction

// Restore link register from the stack
ldp x30, xzr, [sp], #16

// Store the result at the location pointed by outInt
str w0, [x2]

// Add double1 and double2
fadd d0, d0, d1
// Store the result at the location pointed by outDouble
str d0, [x3]

ret
