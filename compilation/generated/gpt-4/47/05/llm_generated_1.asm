//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=1
.global _helperFunction
_helperFunction:
// Saving the link register
stp x30, x29, [sp, #-16]!
mov x29, sp

// Negating the double value
fneg d0, d0

// Restoring link register
ldp x30, x29, [sp], #16
ret

.global _customFunction
_customFunction:
// Saving the link register
stp x30, x29, [sp, #-16]!
mov x29, sp

// *outInt = int1;
str w0, [x2]

// Move double2 from d1 to d0
fmov d0, d1

// Saving the link register before branching to helperFunction
bl  _helperFunction

// Storing the result of helperFunction in *outDouble
str d0, [x3]

// Restoring link register
ldp x30, x29, [sp], #16
ret
