//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _helperFunction
_helperFunction:
// Multiply x0 and x1, result in x0
mul w0, w0, w1

// Return
ret
.global _customFunction
_customFunction:
// Save link register and other necessary registers
stp x29, x30, [sp, #-16]!  // Store pair to stack and update stack pointer
mov x29, sp  // Set frame pointer

// Call helperFunction with int1 and int2
bl _helperFunction

// Store the result to *outInt
str w0, [x2]

// Store double2 to *outDouble
str d1, [x3]

// Restore registers and return
ldp x29, x30, [sp], #16  // Load pair from stack and update stack pointer
ret
