//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Storing the link register to preserve it
str lr, [sp, #-16]!

// Calculate int1 - int2 and store the result at the address pointed by outInt
sub w4, w0, w1     // w4 = int1 - int2
str w4, [x2]       // *outInt = w4

// Perform the subtraction for the double values and store the result
fsub d2, d0, d1    // d2 = double1 - double2
str d2, [x3]       // *outDouble = d2

// Restore the link register
ldr lr, [sp], #16

// Return
ret
