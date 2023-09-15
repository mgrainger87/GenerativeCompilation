//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _helperFunction
_helperFunction:
// Multiplication
mul w0, w0, w1
ret

.global _customFunction
_customFunction:
// Save link register
stp x30, x29, [sp, #-16]!
mov x29, sp

// Call helperFunction with int1 and int2
bl _helperFunction

// Store result of helperFunction into *outInt
str w0, [x2]

// Store double2 into *outDouble
fmov d0, d1
str d0, [x3]

// Restore link register
ldp x30, x29, [sp], #16
ret
