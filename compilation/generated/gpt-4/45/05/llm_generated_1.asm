//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=1
.global _helperFunction
_helperFunction:
// Divide the two floating point numbers and store the result in d0
fdiv d0, d0, d1
// Return from the function
ret

.global _customFunction
_customFunction:
// Save link register (x30) to stack
stp x30, xzr, [sp, #-16]!

// Set the value at outInt to int2
str w1, [x2]

// Call helperFunction with d0 and d1 already having the correct values
bl _helperFunction

// The result from helperFunction is in d0, store it to outDouble
str d0, [x3]

// Restore link register (x30) from stack
ldp x30, xzr, [sp], #16

// Return from the function
ret
