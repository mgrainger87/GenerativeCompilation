//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _helperFunction
_helperFunction:
fmul d0, d0, d1
ret
.global _customFunction
_customFunction:
// Save link register and any other registers we'll use
stp x29, x30, [sp, #-16]!
mov x29, sp

// Call helperFunction
bl _helperFunction

// Store result in *outDouble
str d0, [x3]

// Compute int1 - int2
sub w4, w0, w1

// Store result in *outInt
str w4, [x2]

// Restore registers and return
ldp x29, x30, [sp], #16
ret
