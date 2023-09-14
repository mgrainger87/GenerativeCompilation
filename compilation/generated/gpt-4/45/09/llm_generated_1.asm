//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _helperFunction
_helperFunction:
fdiv d0, d0, d1
ret
.global _customFunction
_customFunction:
// Save the link register (return address) to the stack
stp x30, xzr, [sp, #-16]!

// *outInt = int2;
str w1, [x2]

// Call helperFunction(double1, double2)
bl _helperFunction

// Store result of helperFunction to *outDouble
str d0, [x3]

// Restore the link register from the stack
ldp x30, xzr, [sp], #16

ret
