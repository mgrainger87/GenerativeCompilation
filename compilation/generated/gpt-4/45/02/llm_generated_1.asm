//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _helperFunction
_helperFunction:
fdiv d0, d0, d1    // d0 = a / b
ret                // Return with result in d0
.global _customFunction
_customFunction:
// Save link register to stack
stp x30, xzr, [sp, #-16]!  // Allocate 16 bytes on the stack and store lr and a zero register (for 16-byte alignment)

// *outInt = int2;
str w1, [x2]

// Call helperFunction(double1, double2)
bl _helperFunction

// Store result of helperFunction in *outDouble
str d0, [x3]

// Restore link register from stack
ldp x30, xzr, [sp], #16    // Pop 16 bytes from the stack into lr and a zero register

ret
