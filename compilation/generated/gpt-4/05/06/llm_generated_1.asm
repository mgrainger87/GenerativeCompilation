//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save the link register to the stack
stp x30, x29, [sp, #-16]!
mov x29, sp

// *outInt = int2;
str w1, [x2]

// *outDouble = double1;
str d0, [x3]

// Restore the link register from the stack
ldp x30, x29, [sp], #16
ret
