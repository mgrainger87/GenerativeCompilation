//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.global _helperFunction
_helperFunction:
// double multiplication
fmul d0, d0, d0
ret

.global _customFunction
_customFunction:
// Save link register
stp x30, x29, [sp, #-16]!
mov x29, sp

// *outInt = int1;
str w0, [x2]

// Call helperFunction(double1);
bl _helperFunction

// Store result in *outDouble
str d0, [x3]

// Restore link register and return
ldp x30, x29, [sp], #16
ret
