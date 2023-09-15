//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align 3
_customFunction:
// Save the link register
stp x29, x30, [sp, #-16]!
mov x29, sp

// int1 * int1
mul w4, w0, w0

// Store result in *outInt
str w4, [x2]

// double2 * double2
fmul d2, d1, d1

// Store result in *outDouble
str d2, [x3]

// Restore the link register and return
ldp x29, x30, [sp], #16
ret
