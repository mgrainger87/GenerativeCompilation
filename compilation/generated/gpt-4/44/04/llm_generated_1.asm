//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _helperFunction
_helperFunction:
mul w0, w0, w0   // Multiply a by itself
ret              // Return, result is in x0
.global _customFunction
_customFunction:
// Save callee-saved registers and link register
stp x19, x30, [sp, #-16]!
bl _helperFunction   // Call helperFunction with int1 (which is in x0)
str w0, [x2]         // Store the result to *outInt

fsub d0, d0, d1      // Subtract double2 from double1
str d0, [x3]         // Store the result to *outDouble

// Restore callee-saved registers and link register
ldp x19, x30, [sp], #16
ret
