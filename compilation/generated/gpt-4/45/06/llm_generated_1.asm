//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _helperFunction
_helperFunction:
// Divide d0 by d1 and place result in d0
fdiv d0, d0, d1

// Return with result in d0
ret
.global _customFunction
_customFunction:
// Save link register
stp x30, x29, [sp, #-16]!
mov x29, sp

// *outInt = int2;
str w1, [x2]

// Call helperFunction to compute *outDouble
bl _helperFunction

// Store result of helperFunction in *outDouble
str d0, [x3]

// Restore link register and return
ldp x30, x29, [sp], #16
ret
