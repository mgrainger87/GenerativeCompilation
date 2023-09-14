//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
.align 2
_customFunction:
// Load parameters
sub w4, w0, w1           // w4 = int1 - int2
fsub d4, d0, d1         // d4 = double1 - double2

// Store the results
str w4, [x2]            // *outInt = w4
str d4, [x3]            // *outDouble = d4

ret
