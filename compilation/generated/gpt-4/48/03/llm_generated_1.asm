//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _helperFunction
_helperFunction:
sub w0, wzr, w0  // w0 = -w0
ret

.global _customFunction
_customFunction:
// Save necessary registers
stp x30, x29, [sp, #-16]!
mov x29, sp

// Call helperFunction with int2 as the argument
mov w0, w1
bl _helperFunction

// Store return value to *outInt
str w0, [x2]

// Store double1 to *outDouble
fmov d1, d0
str d1, [x3]

// Restore saved registers
ldp x30, x29, [sp], #16
ret
