//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
_helperFunction:
neg w0, w0     // negate the value of w0 and store in w0
ret            // return
.global _customFunction
_customFunction:
// Save the link register
stp x30, x29, [sp, #-16]!
mov x29, sp

// Call helperFunction with int2 as argument
mov w0, w1              // Copy int2 to w0 for helperFunction's argument
bl _helperFunction      // Branch to helperFunction

// Store the result to *outInt
str w0, [x2]

// Store double1 to *outDouble
fmov d1, d0            // Copy d0 (double1) to d1
str d1, [x3]           // Store d1 to *outDouble

// Restore the link register and return
ldp x30, x29, [sp], #16
ret
