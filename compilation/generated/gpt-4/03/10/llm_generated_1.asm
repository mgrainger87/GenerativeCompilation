//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align  2
_customFunction:
// Save the link register to the stack
stp x30, x29, [sp, #-16]!
mov x29, sp

// Multiply int1 and int2
mul w4, w0, w1 // w4 = int1 * int2

// Store the result to *outInt
str w4, [x2]

// Multiply double1 and double2
fmul d4, d0, d1 // d4 = double1 * double2

// Store the result to *outDouble
str d4, [x3]

// Restore the link register from the stack and return
ldp x30, x29, [sp], #16
ret
