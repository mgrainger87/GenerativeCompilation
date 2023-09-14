//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align 2

_customFunction:
// Multiply int1 (x0) and int2 (x1) and store in w4
mul w4, w0, w1

// Store result in *outInt (pointed by x2)
str w4, [x2]

// Multiply double1 (d0) and double2 (d1) and store in d3
fmul d3, d0, d1

// Store result in *outDouble (pointed by x3)
str d3, [x3]

// Return
ret
