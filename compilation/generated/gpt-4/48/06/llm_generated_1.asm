//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _helperFunction
_helperFunction:
// Entry sequence
stp x29, x30, [sp, #-16]!   // Save frame pointer and link register to stack
mov x29, sp                // Set frame pointer to current stack pointer

// Main logic
neg w0, w0                 // Negate the integer

// Exit sequence
ldp x29, x30, [sp], #16    // Restore frame pointer and link register from stack
ret                        // Return
.global _customFunction
_customFunction:
// Entry sequence
stp x29, x30, [sp, #-16]!  // Save frame pointer and link register to stack
mov x29, sp               // Set frame pointer to current stack pointer

// Call helperFunction
bl _helperFunction        // Branch to helperFunction
str w0, [x2]              // Store return value (negative int2) to *outInt

// Set *outDouble = double1
fmov d0, d0               // Just a redundant move to demonstrate double1 stays in d0
str d0, [x3]              // Store double1 to *outDouble

// Exit sequence
ldp x29, x30, [sp], #16   // Restore frame pointer and link register from stack
ret                       // Return
