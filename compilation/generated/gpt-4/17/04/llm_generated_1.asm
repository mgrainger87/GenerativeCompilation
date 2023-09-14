//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save callee saved registers
stp x19, x20, [sp, #-16]!
stp x21, x22, [sp, #-16]!
stp x23, x24, [sp, #-16]!
stp x25, x26, [sp, #-16]!
stp x27, x28, [sp, #-16]!
stp x29, lr, [sp, #-16]!

// Set the frame pointer for this function
mov x29, sp

// 1. *outInt = (int2 < 0) ? int1 : int2;
cmp w1, #0
csel w19, w0, w1, lt  // w19 = (int2 < 0) ? int1 : int2
str w19, [x2]

// 2. *outDouble = (double1 > double2) ? double1 : double2;
fcmp d0, d1
fcsel d19, d0, d1, gt  // d19 = (double1 > double2) ? double1 : double2
str d19, [x3]

// Restore callee saved registers and return
ldp x29, lr, [sp], #16
ldp x27, x28, [sp], #16
ldp x25, x26, [sp], #16
ldp x23, x24, [sp], #16
ldp x21, x22, [sp], #16
ldp x19, x20, [sp], #16
ret
