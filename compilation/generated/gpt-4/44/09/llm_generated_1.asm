//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _helperFunction
_helperFunction:
// Multiply a by itself and return the result
mul w0, w0, w0
ret
.global _customFunction
_customFunction:
// Save link register (x30) to the stack
stp x30, xzr, [sp, #-16]!

// Call helperFunction(int1)
bl _helperFunction

// Store result in *outInt
str w0, [x2]

// Subtract double2 from double1
fsub d0, d0, d1

// Store result in *outDouble
str d0, [x3]

// Restore link register (x30) from the stack
ldp x30, xzr, [sp], #16

ret
