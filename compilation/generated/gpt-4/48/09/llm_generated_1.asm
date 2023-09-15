//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _helperFunction
_helperFunction:
// Return -a
neg w0, w0
ret

.global _customFunction
_customFunction:
// Store link register and callee-saved registers
stp x29, x30, [sp, #-16]!
mov x29, sp

// Call helperFunction(int2)
mov w0, w1
bl _helperFunction
// result is in x0
str w0, [x2]

// Assign double1 to *outDouble
str d0, [x3]

// Restore link register and callee-saved registers and return
ldp x29, x30, [sp], #16
ret
