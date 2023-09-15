//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _helperFunction
_helperFunction:
// Multiply a by a (w0 * w0)
mul w0, w0, w0
// Return value is in w0
ret
.global _customFunction
_customFunction:
// Save link register to stack
stp x30, x29, [sp, #-16]!
mov x29, sp

// Call helperFunction for int1 (w0)
bl _helperFunction

// Store the result in *outInt (x2)
str w0, [x2]

// Perform floating point subtraction double1 - double2 (d0 - d1)
fsub d0, d0, d1

// Store the result in *outDouble (x3)
str d0, [x3]

// Restore link register from stack and return
ldp x30, x29, [sp], #16
ret
