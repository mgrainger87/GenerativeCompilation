//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _helperFunction
_helperFunction:
fdiv d0, d0, d1      // d0 = a / b
ret
.global _customFunction
_customFunction:
// Storing the link register and callee-saved registers
stp x19, x20, [sp, #-16]!
stp x21, x22, [sp, #-16]!
stp x23, x24, [sp, #-16]!
stp x25, x26, [sp, #-16]!
stp x27, x28, [sp, #-16]!
stp x29, x30, [sp, #-16]!  // x29 is frame pointer, x30 is link register
mov x29, sp  // Set up frame pointer

// *outInt = int2;
str w1, [x2]

// *outDouble = helperFunction(double1, double2);
bl _helperFunction
str d0, [x3]

// Restoring the link register and callee-saved registers
ldp x29, x30, [sp], #16
ldp x27, x28, [sp], #16
ldp x25, x26, [sp], #16
ldp x23, x24, [sp], #16
ldp x21, x22, [sp], #16
ldp x19, x20, [sp], #16

ret
