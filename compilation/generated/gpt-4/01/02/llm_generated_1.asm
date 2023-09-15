//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Add the integers
add w4, w0, w1        // w4 = int1 + int2

// Store the result in *outInt
str w4, [x2]

// Add the doubles
fadd d4, d0, d1      // d4 = double1 + double2

// Store the result in *outDouble
str d4, [x3]

ret
