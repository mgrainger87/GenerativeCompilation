//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _helperFunction
_helperFunction:
// Input: w0 = a, w1 = b
add w0, w0, w1        // w0 = a + b
ret                   // Return with w0 as the result
.global _customFunction
_customFunction:
// Input: w0 = int1, w1 = int2, d0 = double1, d1 = double2, x2 = outInt, x3 = outDouble

// Save the link register since we will be making a call
stp x29, x30, [sp, #-16]!    // Save frame pointer and link register to the stack
mov x29, sp                  // Set the frame pointer

// Call the helper function
bl _helperFunction           // Call helperFunction. Result is in w0

// Store the result from helperFunction to *outInt
str w0, [x2]

// Add the two doubles
fadd d0, d0, d1

// Store the result to *outDouble
str d0, [x3]

// Restore the link register and return
ldp x29, x30, [sp], #16
ret
