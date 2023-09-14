//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _helperFunction
_helperFunction:
// Save callee-saved registers
stp x29, x30, [sp, #-16]!  // Store pair (frame pointer and link register) to the stack
mov x29, sp               // Set frame pointer

fdiv d0, d0, d1           // d0 = d0 / d1 (a / b)

// Restore callee-saved registers and return
ldp x29, x30, [sp], #16   // Load pair (frame pointer and link register) from the stack
ret
.global _customFunction
_customFunction:
// Save callee-saved registers
stp x29, x30, [sp, #-16]!  // Store pair (frame pointer and link register) to the stack
mov x29, sp               // Set frame pointer

// *outInt = int2;
str w1, [x2]

// Prepare to call helperFunction(double1, double2)
// Arguments are already in d0 and d1, so no need to move them

bl _helperFunction        // Call helperFunction

// After returning from helperFunction, the result is in d0
// *outDouble = helperFunction(double1, double2);
str d0, [x3]

// Restore callee-saved registers and return
ldp x29, x30, [sp], #16   // Load pair (frame pointer and link register) from the stack
ret
