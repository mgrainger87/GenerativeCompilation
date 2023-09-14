//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _helperFunction
_helperFunction:
fdiv d0, d0, d1
ret
.global _customFunction
_customFunction:
// Save caller-saved registers (x30 is the link register)
stp x29, x30, [sp, #-16]!
mov x29, sp

// Set the value of outInt = int2
str w1, [x2]

// Call helperFunction(double1, double2)
bl _helperFunction

// Store the result in *outDouble
str d0, [x3]

// Restore caller-saved registers
ldp x29, x30, [sp], #16
ret
