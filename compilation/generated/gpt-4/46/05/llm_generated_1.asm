//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _helperFunction
_helperFunction:
// Multiply x0 and x1, store result in x0
mul x0, x0, x1
ret
.global _customFunction
_customFunction:
// Save the link register (lr) and other necessary registers to the stack
stp x29, x30, [sp, #-16]!  // Store frame pointer and link register
mov x29, sp                // Update frame pointer

// Call helperFunction
bl _helperFunction
// Store the result (x0) at the address in x2
str w0, [x2]

// Load double2 (d1) to the address in x3
str d1, [x3]

// Restore the link register (lr) and other necessary registers from the stack
ldp x29, x30, [sp], #16  // Load frame pointer and link register
ret
