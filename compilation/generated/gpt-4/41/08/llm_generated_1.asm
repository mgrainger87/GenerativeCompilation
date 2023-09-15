//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _helperFunction
_helperFunction:
add w0, w0, w1      // w0 = a + b
ret                 // return with the result in w0
.global _customFunction
_customFunction:
// Save the link register (lr) as we're going to make a function call.
stp lr, x29, [sp, #-16]!   // Store pair to the stack.
mov x29, sp                // Set frame pointer.

// Call helperFunction(int1, int2)
bl _helperFunction         // Branch with link to helperFunction.

// Store the result of helperFunction in *outInt
str w0, [x2]               // Store w0 to the address pointed by outInt.

// Perform double1 + double2
fadd d0, d0, d1            // d0 = double1 + double2

// Store the result in *outDouble
str d0, [x3]               // Store d0 to the address pointed by outDouble.

// Restore lr and return.
ldp lr, x29, [sp], #16     // Load pair from the stack.
ret
