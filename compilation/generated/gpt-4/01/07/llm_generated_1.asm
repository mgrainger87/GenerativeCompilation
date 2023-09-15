//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Add the integer values and store in *outInt
add w4, w0, w1       // w4 = int1 + int2
str w4, [x2]         // *outInt = w4

// Add the double values and store in *outDouble
fadd d4, d0, d1      // d4 = double1 + double2
str d4, [x3]         // *outDouble = d4

ret                  // Return to caller
