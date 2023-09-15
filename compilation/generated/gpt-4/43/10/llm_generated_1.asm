//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _helperFunction
_helperFunction:
// Square the double precision float value
fmul d0, d0, d0    // d0 = d0 * d0
ret
.global _customFunction
_customFunction:
// Store int1 into *outInt
str w0, [x2]

// Save link register (LR) and x3 (since we'll need it after the function call)
stp x30, x3, [sp, #-16]!  // Pre-indexed addressing, push x30 and x3 to the stack

// Call helperFunction for double1
bl _helperFunction  // This modifies the link register (LR)

// Load the saved link register (LR) and x3 back from the stack
ldp x30, x3, [sp], #16  // Post-indexed addressing, pop x30 and x3 from the stack

// Store the result into *outDouble
str d0, [x3]

// Return
ret
