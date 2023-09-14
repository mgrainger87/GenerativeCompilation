//compiler_errors=0,linker_errors=0,execution_errors=0,correctness_errors=0
.global _customFunction
_customFunction:
// Save necessary registers
stp x29, x30, [sp, #-16]!   // Save frame pointer and link register
mov x29, sp                // Update frame pointer

// *outInt = int2;
str w1, [x2]

// *outDouble = double1;
str d0, [x3]

// Restore necessary registers and return
ldp x29, x30, [sp], #16    // Restore frame pointer and link register
ret
