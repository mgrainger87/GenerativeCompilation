//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save the link register
stp x30, x29, [sp, #-16]!
mov x29, sp

// int1 - int2
sub w4, w0, w1

// Store the result of subtraction to *outInt
str w4, [x2]

// double1 - double2
fsub d4, d0, d1

// Store the result of subtraction to *outDouble
str d4, [x3]

// Restore the link register and return
ldp x30, x29, [sp], #16
ret
