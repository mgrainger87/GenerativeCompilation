//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _helperFunction
_helperFunction:
add x0, x0, #10       // x0 = x0 + 10
ret                  // Return, result is in x0
.global _customFunction
_customFunction:
// Save the link register
stp x30, x29, [sp, #-16]!
mov x29, sp          // Set up frame pointer for this function

// Call helperFunction(int1)
bl _helperFunction   // Call helperFunction

// Store result of helperFunction at *outInt
str w0, [x2]

// Store double2 at *outDouble
str d1, [x3]

// Restore the link register and frame pointer
ldp x30, x29, [sp], #16

ret                  // Return
