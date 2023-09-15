//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.globl  _customFunction
.align  2
_customFunction:
// Store the result of int1 + int2 at the address pointed to by outInt
add     w4, w0, w1        // w4 = int1 + int2
str     w4, [x2]          // Store the result in the location pointed to by outInt

// Store the result of double1 + double2 at the address pointed to by outDouble
fadd    d4, d0, d1        // d4 = double1 + double2
str     d4, [x3]          // Store the result in the location pointed to by outDouble

ret                       // Return to the caller
