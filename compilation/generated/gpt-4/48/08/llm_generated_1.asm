//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _helperFunction
_helperFunction:
// a is already in x0
neg w0, w0     // Negate the value of a
ret
.global _customFunction
_customFunction:
// Saving link register and callee-saved registers
stp x29, x30, [sp, #-16]!
mov x29, sp

// Call helperFunction with int2
mov w0, w1
bl _helperFunction

// Store result in *outInt
str w0, [x2]

// Store double1 in *outDouble
str d0, [x3]

// Restore link register and return
ldp x29, x30, [sp], #16
ret
