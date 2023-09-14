//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _helperFunction
_helperFunction:
fdiv d0, d0, d1      // d0 = a / b
ret                  // return with the result in d0
.global _customFunction
_customFunction:
// Save the link register to preserve return address
stp x29, x30, [sp, #-16]!
mov x29, sp

// *outInt = int2;
str w1, [x2]

// *outDouble = helperFunction(double1, double2);
bl _helperFunction   // call helperFunction

// Store the result to *outDouble
str d0, [x3]

// Restore the link register
ldp x29, x30, [sp], #16
ret
