//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Saving caller-saved registers and link register
stp x8, x9, [sp, #-16]!
stp x10, x11, [sp, #-16]!
stp x12, x13, [sp, #-16]!
stp x14, x15, [sp, #-16]!
stp x16, x17, [sp, #-16]!
stp x18, lr, [sp, #-16]!
stp d8, d9, [sp, #-16]!

// *outInt = int1 * 3 - int2;
mov w8, #3
mul w9, w0, w8
sub w10, w9, w1
str w10, [x2]

// *outDouble = double1 - double2 * 3;
fmov d8, #3.0
fmul d9, d1, d8
fsub d10, d0, d9
str d10, [x3]

// Restoring caller-saved registers and link register
ldp d8, d9, [sp], #16
ldp x18, lr, [sp], #16
ldp x16, x17, [sp], #16
ldp x14, x15, [sp], #16
ldp x12, x13, [sp], #16
ldp x10, x11, [sp], #16
ldp x8, x9, [sp], #16

ret
