//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save the link register
stp x30, x29, [sp, #-16]!
mov x29, sp

// Compare int2 with 0
cmp w1, #0
// If int2 < 0, store int1 to *outInt, otherwise store int2
csel w4, w0, w1, lt
str w4, [x2]

// Compare double1 with double2
fcmp d0, d1
// If double1 > double2, store double1 to *outDouble, otherwise store double2
fcsel d3, d0, d1, gt
str d3, [x3]

// Restore the link register and return
ldp x30, x29, [sp], #16
ret
