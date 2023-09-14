//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align 3
_customFunction:
// Multiply int1 and int2
mul w4, w0, w1        // w4 = int1 * int2

// Multiply double1 and double2
fmul d4, d0, d1       // d4 = double1 * double2

// Store results in pointers
str w4, [x2]          // *outInt = w4
str d4, [x3]          // *outDouble = d4

ret
