//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align 2
_customFunction:
// Multiply int1 and int2. Result in x0
mul x0, x0, x1

// Store the result to *outInt
str w0, [x2]

// Multiply double1 and double2. Result in d0
fmul d0, d0, d1

// Store the result to *outDouble
str d0, [x3]

// Return
ret
