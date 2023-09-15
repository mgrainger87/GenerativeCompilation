//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
stp x30, xZR, [sp, #-16]!     // Save the link register (x30) to the stack along with xZR to maintain stack alignment
mul w4, w0, w0                // Multiply int1 with itself and store the result in w4
str w4, [x2]                  // Store the result to the location pointed by outInt
fmul d2, d1, d1               // Multiply double2 with itself and store the result in d2
str d2, [x3]                  // Store the result to the location pointed by outDouble
ldp x30, xZR, [sp], #16       // Restore the link register (x30) from the stack
ret                           // Return from the function
