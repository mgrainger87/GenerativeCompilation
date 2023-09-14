//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save the link register and callee-saved registers
stp x29, x30, [sp, #-16]!    // Save frame pointer and link register
mov x29, sp                 // Set frame pointer

// Check if int1 is even: int1 % 2 == 0
and w4, w0, #1              // w4 = int1 & 1
cbz w4, even_branch         // If w4 == 0, jump to even_branch

// Odd branch
str w0, [x2]                // *outInt = int1
fmov d2, d0                 // d2 = double1
str d2, [x3]                // *outDouble = double1
b end_func                  // Jump to the end of the function

even_branch:
// Even branch
lsr w5, w0, #1              // w5 = int1 / 2
str w5, [x2]                // *outInt = int1 / 2

fmov d3, #2.0               // Load 2.0 into d3
fmul d4, d0, d3             // d4 = double1 * 2.0
str d4, [x3]                // *outDouble = double1 * 2.0

end_func:
// Restore the link register and callee-saved registers
ldp x29, x30, [sp], #16     // Restore frame pointer and link register
ret                         // Return
