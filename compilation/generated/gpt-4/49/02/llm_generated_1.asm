//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _helperFunction
_helperFunction:
// The function takes two double arguments in d0 and d1
// and returns the result in d0
fadd    d0, d0, d1    // d0 = d0 + d1
ret
.global _customFunction
_customFunction:
// Save the link register (LR) to the stack
stp     x30, xzr, [sp, #-16]!

// Handle the integer addition and store the result to outInt
add     w4, w0, w1    // w4 = w0 + w1
str     w4, [x2]      // Store w4 to the address pointed by x2

// Call helperFunction for double addition
bl      _helperFunction

// Store the result of helperFunction (in d0) to outDouble
str     d0, [x3]      // Store d0 to the address pointed by x3

// Restore the link register and return
ldp     x30, xzr, [sp], #16
ret
