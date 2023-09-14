//compiler_errors=1,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
stp x29, x30, [sp, #-16]!    // Save frame pointer and link register
mov x29, sp                  // Set frame pointer

and w4, w0, #1               // w4 = int1 % 2
cbz w4, .L0                 // If w4 is zero, branch to .L0

// Else block
str w0, [x2]                // *outInt = int1
str d0, [x3]               // *outDouble = double1
b .L1                       // Branch to end

.L0:
// If block
lsr w5, w0, #1              // w5 = int1 / 2
str w5, [x2]                // *outInt = w5

fmov d2, #2.0               // Load 2.0 into d2
fmul d3, d0, d2             // d3 = double1 * 2.0
str d3, [x3]               // *outDouble = d3

.L1:
ldp x29, x30, [sp], #16     // Restore frame pointer and link register
ret                         // Return from function
