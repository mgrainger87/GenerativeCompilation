//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.globl _customFunction
.align 2
_customFunction:
// Multiply int2 by itself
mul w4, w1, w1       // w4 = int2 * int2

// Store result in *outInt
str w4, [x2]

// Multiply double1 by itself
fmul d4, d0, d0     // d4 = double1 * double1

// Store result in *outDouble
str d4, [x3]

// Return
ret
