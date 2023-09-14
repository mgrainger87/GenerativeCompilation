//compiler_errors=0,linker_errors=0,execution_errors=2,correctness_errors=0
.global _customFunction
_customFunction:
// Save link register and align stack
stp     lr, x29, [sp, #-32]!
mov     x29, sp

// *outInt = (int2 < 0) ? int1 : int2;
cmp     w1, #0
csel    w4, w0, w1, lt
str     w4, [x2]

// *outDouble = (double1 > double2) ? double1 : double2;
fcmp    d0, d1
fcsel   d2, d0, d1, gt
str     d2, [x3]

// Restore link register and return
ldp     lr, x29, [sp], #32
ret
